﻿using System.ComponentModel.Design;
using Application.Interfaces.Infrastructure.Postgres.PatientRep;
using Application.Interfaces.Infrastructure.Websocket;
using Application.Interfaces.IPatientService;
using Application.Models.Dtos.ChatDtos;
using Application.Models.Dtos.DoctorDto.response;
using Application.Models.Dtos.PatientDto;
using Application.Models.Dtos.PatientDto.response;
using Core.Domain.Entities;

namespace Application.Services.PatientService;

public class BookingService (IBookingRep bookingRep, IConnectionManager connectionManager) : IBookingService
{
    public async Task<List<AvailabilityDto>> RetrieveBookingInfo(string doctorId)
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


        return availableDatesFiltered;

    }

    /* This method creates times slots for doctor based on rules provided(Monday doctor works 9-5) */ 
    private List<AvailabilityDto> BuildDoctorAvailableSlots(
        List<DoctorAvailability> weeklyAvailability,
        int daysToGenerate = 30,
        int durationOfSession = 30)
    {
        var today = DateTime.Today;
        var allSlots = new List<AvailabilityDto>();
        
        /* Generates slots for the next 30 days and converts to string */

        for (int i = 0; i < daysToGenerate; i++)
        {
            var currentDate = today.AddDays(i);
            var currentDayName = currentDate.DayOfWeek.ToString();
            
            /* Finds a day that matches the generates one */

            var matchingRules = weeklyAvailability
                .Where(a => a.DayOfWeek == currentDayName);

            foreach (var rule in matchingRules)
            {
                var dailySlots = GenerateSlotsForRule(rule, currentDate, durationOfSession);
                allSlots.AddRange(dailySlots);

            }
        }

        return allSlots;
    }
    
    private List<AvailabilityDto> GenerateSlotsForRule(DoctorAvailability rule, DateTime currentDateUtc, int sessionDuration)
    {
        var result = new List<AvailabilityDto>();
        
        /* ToTimeSpan() converts time values into a number of hours and minutes.
          Add() then adds these TimeSpan values to currentDateUtc to get the actual DateTime values. */

        var start = currentDateUtc.Add(rule.StartTime.ToTimeSpan());
        var end = currentDateUtc.Add(rule.EndTime.ToTimeSpan());
        
         /* Creates small intervals of time slots based on session duraton  */
        for (DateTime slotStart = start;
             slotStart.AddMinutes(sessionDuration) <= end;
             slotStart = slotStart.AddMinutes(sessionDuration))
        {
            var slotEnd = slotStart.AddMinutes(sessionDuration);
            var utcAppointmentStart = TimeZoneInfo.ConvertTimeToUtc(slotStart);
            if (utcAppointmentStart > DateTime.UtcNow)
            {
                result.Add(new AvailabilityDto()
                {
                    StartTime = slotStart,
                    EndTime = slotEnd
                });
            }
        }

        return result;
    }

    
    
    
    public async Task BookAppointment(BookAppointmentDto dto, CreateChatRoomDto dtoChatRoom)
    {
        var appointments = BookAppointmentDto.ToEntity(dto);
        var chatRoom = CreateChatRoomDto.ToEntity(dtoChatRoom);
        var savedId = await bookingRep.ManageAppointments(appointments, chatRoom);
        
        var broadcast = new BroadcastBookedSlotDto()
        {
            Id = savedId
        };
        await connectionManager.BroadcastToTopic($"doctor_{dto.DoctorId}",broadcast);
        
        
    }

    public async Task <List<FutureAppointmentsDto>> RetrieveFutureAppointments(string userId)
    {
        var futureAppointments = await bookingRep.RetrieveFutureAppointments(userId);
        var futureAppointmentsDto = futureAppointments
            .Select(FutureAppointmentsDto.FromEntity)
            .ToList();
        return futureAppointmentsDto;
        
    }

    public async Task<List<PastAppointmentsDto>> RetrievePastAppointments(string userId)
    {
        var pastAppointments = await bookingRep.RetrievePastAppointments(userId);
        var pastAppointmentsDto = pastAppointments
            .Select(PastAppointmentsDto.FromEntity)
            .ToList();
        return pastAppointmentsDto;
        
    }

    public async Task CancelAppointment(CancelAppointmentDto dto)
    {
        await bookingRep.CancelAppointment(dto.Id);
        var cancelledAppointment = new CancelledAppointment()
        {
            AppointmentId = dto.Id
        };

        await connectionManager.BroadcastToTopic(dto.DoctorId, cancelledAppointment);
    }

    public async Task<List<ClinicDoctorDto>> RetrieveClinicDoctors(string clinicId)
    {
        var doctors = await bookingRep.RetrieveClinicDoctor(clinicId);
        var doctorsDto = doctors
            .Select(ClinicDoctorDto.FromEntity)
            .ToList();
        return doctorsDto;
    }
}