using Application.Interfaces.Infrastructure.Postgres.PatientRep;
using Core.Domain.Entities;
using Infrastructure.Postgres.Scaffolding;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Postgres.Postgresql.Data.PatientRepo;

public class BookingRepo (MyDbContext context): IBookingRep
{
    
    public async Task<List<DoctorAvailability>> RetrieveDoctorAvailability(string doctorId)
    {
        return await context.DoctorAvailabilities
            .Where(d => d.DoctorId == doctorId)
            .ToListAsync();
    }
    public async Task<List<Appointment>> RetrieveDoctorAppointments(string doctorId)
    {
        return await context.Appointments
            .Where(a => a.DoctorId == doctorId && a.Status == "confirmed")
            .ToListAsync();
    }

    public async Task<string> BookAppointment(Appointment appointment)
    {
        var result = await context.Appointments.AddAsync(appointment);
        await context.SaveChangesAsync(); 

        return result.Entity.Id;
    }

    public async Task<List<Appointment>> RetrieveFutureAppointments(string userId)
    {
        Console.WriteLine($"Current UTC Time: {DateTime.UtcNow}");
        Console.WriteLine($"UserId: {userId}");

        var result = await context.Appointments
            .Where(a => a.PatientId == userId && a.StartTime > DateTime.UtcNow)
            .ToListAsync();

        Console.WriteLine($"Appointments found: {result.Count}");
        foreach (var appointment in result)
        {
            Console.WriteLine($"ID: {appointment.Id}, StartTime: {appointment.StartTime}, PatientId: {appointment.PatientId}");
        }
        return result;

       
    }
    
    public async Task<List<Appointment>> RetrievePastAppointments(string userId)
    {
        return await context.Appointments
            .Where(a => a.PatientId == userId && a.StartTime < DateTime.UtcNow)
            .ToListAsync();
    }

    public async Task CancelAppointment(string dtoId)
    {
        var user =  context.Appointments
            .Where(a => a.Id == dtoId);
        context.Appointments.RemoveRange(user);
        await context.SaveChangesAsync();

    }
}