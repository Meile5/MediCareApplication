using Application;
using Application.Interfaces.Infrastructure.Postgres.PatientRep;
using Core.Domain.Entities;
using Infrastructure.Postgres.Scaffolding;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Postgres.Postgresql.Data.PatientRepo;

public class BookingRepo (MyDbContext context,  ILogger<BookingRepo> logger): IBookingRep
{
    
    public async Task<List<DoctorAvailability>> RetrieveDoctorAvailability(string doctorId)
    {
        try
        {
            return await context.DoctorAvailabilities
                .Where(d => d.DoctorId == doctorId)
                .ToListAsync();
        }
        catch (Exception ex)
        {
            logger.LogError(ex, ErrorMessages.GetMessage(ErrorCode.DoctorAvailability));
            throw;
        }
    }
    public async Task<List<Appointment>> RetrieveDoctorAppointments(string doctorId)
    {
        try
        {
            return await context.Appointments
                .Where(a => a.DoctorId == doctorId && a.Status == "confirmed")
                .ToListAsync();
        }
        catch (Exception ex)
        {
            logger.LogError(ex, ErrorMessages.GetMessage(ErrorCode.DoctorAvailability));
            throw;
        }
    }
    
    
    public async Task<Appointment> ManageAppointments(Appointment appointment)
    {
        try
        {
            var result = await context.Appointments.AddAsync(appointment);
            await context.SaveChangesAsync(); 
            return result.Entity;

        }
        catch (Exception ex)
        {
            logger.LogError(ex, ErrorMessages.GetMessage(ErrorCode.Booking));
            throw;
        }
        
    }


    public async Task<List<Appointment>> RetrieveFutureAppointments(string userId)
    {
        try
        {
            var result = await context.Appointments
                .Where(a => a.PatientId == userId && a.EndTime > DateTime.UtcNow)
                .ToListAsync();
        
            return result;

        }
        catch (Exception ex)
        {
            logger.LogError(ex, ErrorMessages.GetMessage(ErrorCode.FutureAppointments));
            throw;
        }
        
    }
    
    public async Task<List<Appointment>> RetrievePastAppointments(string userId)
    {
        try
        {
            return await context.Appointments
                .Where(a => a.PatientId == userId && a.EndTime < DateTime.UtcNow)
                .ToListAsync();
        }
        catch (Exception ex)
        {
            logger.LogError(ex, ErrorMessages.GetMessage(ErrorCode.FutureAppointments));
            throw;
            
        }
    }

    public async Task CancelAppointment(string dtoId)
    {
        try
        {
            var user = context.Appointments
                .Where(a => a.Id == dtoId);
            context.Appointments.RemoveRange(user);
            await context.SaveChangesAsync();
        }
        catch (Exception ex)
        {
            logger.LogError(ex, ErrorMessages.GetMessage(ErrorCode.CancelAppointment));
        }

    }

    public async Task<List<Doctor>> RetrieveClinicDoctor(string clinicId)
    {
        try
        {
            var result = await context.ClinicDoctors
                .Where(cd => cd.Idclinic == clinicId)
                .Join(
                    context.Doctors,
                    cd => cd.Iddoctor,
                    d => d.Doctorid,
                    (cd, d) => d
                )
                .ToListAsync();

            return result;
        }
        catch (Exception ex)
        {
            logger.LogError(ex, ErrorMessages.GetMessage(ErrorCode.ClinicDoctor));
            throw;
        }
        

    }
}