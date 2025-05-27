using Application;
using Application.Interfaces.Infrastructure.Postgres.DoctorRep;
using Application.Models.Enums;
using Core.Domain.Entities;
using Infrastructure.Postgres.Scaffolding;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Postgres.Postgresql.Data.DoctorRepo;

public class AppointmentRepo(MyDbContext dbContext, ILogger<AppointmentRepo> logger) : IAppointmentRep
{
    public async Task ConfirmAppointment(string appointmentId)
    {
        try
        {
            var appointment = await dbContext.Appointments.FirstOrDefaultAsync(ap => ap.Id == appointmentId);
            if (appointment != null)
            {
                appointment.Status = Status.Confirmed;
                await dbContext.SaveChangesAsync();
            }
        }
        catch (Exception e)
        {
            logger.LogError(e, "Failed to confirm appointment");
        }
    }

    public async Task<string> GetPatientName(string appointmentId){
        try
        {
            var appointment = await dbContext.Appointments
                .Include(a => a.Patient)
                .FirstOrDefaultAsync(a => a.Id == appointmentId);

            if (appointment == null || appointment.Patient == null)
            {
                throw new Exception("Appointment or patient not found.");
            }

            return $"{appointment.Patient.Name} {appointment.Patient.Surname}";
        }
        catch (Exception e)
        {
            logger.LogError(e, ErrorMessages.GetMessage(ErrorCode.Patients));
            throw;
        }
}


    public async Task RejectAppointment(string appointmentId)
    {
        try
        {
            var appointment = await dbContext.Appointments.FirstOrDefaultAsync(ap => ap.Id == appointmentId);
            if (appointment != null)
            {
                appointment.Status = Status.Cancelled;
                await dbContext.SaveChangesAsync();
            }
        }
        catch (Exception e)
        {
            logger.LogError(e, ErrorMessages.GetMessage(ErrorCode.CancelAppointment));
        }
    }

    public async Task<List<Appointment>> RetrieveDoctorAppointments(string doctorId)
    {
        try
        {
            return await dbContext.Appointments
                .Where(a => a.DoctorId == doctorId)
                .ToListAsync();
        }
        catch (Exception e)
        {
            logger.LogError(e, ErrorMessages.GetMessage(ErrorCode.FutureAppointments));
            throw;
        }
    }
}