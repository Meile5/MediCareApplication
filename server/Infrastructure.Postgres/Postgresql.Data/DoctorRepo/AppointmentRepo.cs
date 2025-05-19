using Application.Interfaces.Infrastructure.Postgres.DoctorRep;
using Core.Domain.Entities;
using Infrastructure.Postgres.Scaffolding;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Postgres.Postgresql.Data.DoctorRepo;

public class AppointmentRepo(MyDbContext dbContext) : IAppointmentRep
{
    public async Task ConfirmAppointment(string appointmentId)
    {
        var appointment = await dbContext.Appointments.FirstOrDefaultAsync(ap => ap.Id == appointmentId);
        if (appointment != null)
        {
            appointment.Status = "confirmed";
            await dbContext.SaveChangesAsync();
        }
    }

    public async Task<string> GetPatientName(string appointmentId){
    var appointment = await dbContext.Appointments
        .Include(a => a.Patient)
        .FirstOrDefaultAsync(a => a.Id == appointmentId);

    if (appointment == null || appointment.Patient == null)
    {
        throw new Exception("Appointment or patient not found.");
    }

    return $"{appointment.Patient.Name} {appointment.Patient.Surname}";
}


    public async Task RejectAppointment(string appointmentId)
    {
        var appointment = await dbContext.Appointments.FirstOrDefaultAsync(ap => ap.Id == appointmentId);
        if (appointment != null)
        {
            appointment.Status = "rejected";
            await dbContext.SaveChangesAsync();
        }
    }

    public async Task<List<Appointment>> RetrieveDoctorAppointments(string doctorId)
    {
        return await dbContext.Appointments
            .Where(a => a.DoctorId == doctorId)
            .ToListAsync();
    }
}