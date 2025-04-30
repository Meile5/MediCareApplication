using System.ComponentModel.Design;
using Application.Interfaces.Infrastructure.Postgres.PatientRep;
using Application.Interfaces.Infrastructure.Websocket;
using Application.Interfaces.IPatientService;
using Application.Models.Dtos.PatientDto;
using Core.Domain.Entities;

namespace Application.Services.PatientService;

public class BookingService (IBookingRep bookingRep, IConnectionManager connectionManager) : IBookingService
{
    public async Task<DoctorAvailabilityResponseDto> RetrieveBookingInfo(string doctorId)
    {
        var availability = await bookingRep.RetrieveDoctorAvailability(doctorId);
        var appointments = await bookingRep.RetrieveDoctorAppointments(doctorId);

        var availableSlots = BuildDoctorAvailableSlots(availability);
       
        var appointmentsDto = appointments
            .Select(AppointmentDto.FromEntity)
            .ToList();
        
        var availableDatesFiltered = availableSlots
            .Where(s => !appointmentsDto.Any(a => 
                a.StartTime == s.StartTime && a.EndTime == s.EndTime))
            .ToList();        

        
        return new DoctorAvailabilityResponseDto()
        {
            AvailableDates = availableDatesFiltered,
            Appointments = appointmentsDto
        };
    }


    private List<AvailabilityDto> BuildDoctorAvailableSlots(
        List<DoctorAvailability> weeklyAvailability,
        int daysToGenerate = 30,
        int durationOfSession = 60)
    {
        var today = DateTime.Today;
        var result = new List<AvailabilityDto>();

        for (int i = 0; i < daysToGenerate; i++)
        {
            var currentDate = today.AddDays(i);
            var currentDayName = currentDate.DayOfWeek.ToString();

            var matchingRules = weeklyAvailability
                .Where(a => a.DayOfWeek == currentDayName);

            foreach (var rule in matchingRules)
            {
                var start = currentDate.Add(rule.StartTime.ToTimeSpan());
                var end = currentDate.Add(rule.EndTime.ToTimeSpan());
                Console.WriteLine($"Full Day Slot: {start} to {end}");

                for (DateTime appointmentStart = start;
                     appointmentStart.AddMinutes(durationOfSession) <= end;
                     appointmentStart = appointmentStart.AddMinutes(durationOfSession))
                {
                    var appointmentEnd = appointmentStart.AddMinutes(durationOfSession);
                    
                    result.Add(new AvailabilityDto()
                    {
                        StartTime = appointmentStart,
                        EndTime = appointmentEnd
                    });

                    Console.WriteLine($"Slot Added: {appointmentStart} - {appointmentEnd}");
                }
            }
        }

        Console.WriteLine($"Total Slots Generated: {result.Count}");
        return result;
    }
    
    
    
    public async Task BookAppointment(BookAppointmentDto dto)
    {
        var appointments = BookAppointmentDto.ToEntity(dto);
        var savedId = await bookingRep.BookAppointment(appointments);
        
        var broadcast = new BroadcastBookedSlotDto()
        {
            Id = savedId
        };
        await connectionManager.BroadcastToTopic($"doctor_{dto.DoctorId}",broadcast);
        
        
    }



}