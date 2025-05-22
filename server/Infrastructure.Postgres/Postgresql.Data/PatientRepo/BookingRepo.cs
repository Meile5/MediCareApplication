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
    
    public async Task<string> ManageAppointments(Appointment appointment)
    {
        await using (var transaction = await context.Database.BeginTransactionAsync())
        {
            try
            {
                var id = await BookAppointment(appointment);


                

                await transaction.CommitAsync();

                return (id);
            }
            catch (Exception ex)
            {
                await transaction.RollbackAsync();
                //_logger.LogError(ex, ErrorMessages.GetMessage(ErrorCode.InsertingTicketsFailed));
                //throw new ApplicationException(ErrorMessages.GetMessage(ErrorCode.InsertingTicketsFailedCustomer), ex);
                throw new ApplicationException(ex.Message);

            }
        }
    }


    public async Task<List<Appointment>> RetrieveFutureAppointments(string userId)
    {
        var result = await context.Appointments
            .Where(a => a.PatientId == userId && a.EndTime > DateTime.UtcNow)
            .ToListAsync();
        
        return result;
        
    }
    
    public async Task<List<Appointment>> RetrievePastAppointments(string userId)
    {
        return await context.Appointments
            .Where(a => a.PatientId == userId && a.EndTime < DateTime.UtcNow)
            .ToListAsync();
    }

    public async Task CancelAppointment(string dtoId)
    {
        var user =  context.Appointments
            .Where(a => a.Id == dtoId);
        context.Appointments.RemoveRange(user);
        await context.SaveChangesAsync();

    }

    public async Task<List<Doctor>> RetrieveClinicDoctor(string clinicId)
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
}