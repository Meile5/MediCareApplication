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

    public async Task BookAppointment(Appointment appointments)
    {
        await context.Appointments.AddAsync(appointments);
    }
}