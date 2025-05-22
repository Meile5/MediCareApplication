using Application.Interfaces.Infrastructure.Postgres.DoctorRep;
using Core.Domain.Entities;
using Infrastructure.Postgres.Scaffolding;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Postgres.Postgresql.Data.DoctorRepo;

public class DoctorRepo(MyDbContext context) : IDoctorRep
{
    public async Task<Doctor> GetDoctorById(string doctorId)
    {
        return await context.Doctors.FirstOrDefaultAsync(p => p.Doctorid == doctorId);
    }
}