using Application;
using Application.Interfaces.Infrastructure.Postgres.DoctorRep;
using Core.Domain.Entities;
using Infrastructure.Postgres.Scaffolding;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Postgres.Postgresql.Data.DoctorRepo;

public class DoctorRepo(MyDbContext context, ILogger<DoctorRepo> logger) : IDoctorRep
{
    public async Task<Doctor> GetDoctorById(string doctorId)
    {
        try
        {
            return await context.Doctors.FirstOrDefaultAsync(p => p.Doctorid == doctorId);
        }
        catch (Exception e)
        {
            logger.LogError(e, ErrorMessages.GetMessage(ErrorCode.Doctor));
            throw;
        }
    }
}