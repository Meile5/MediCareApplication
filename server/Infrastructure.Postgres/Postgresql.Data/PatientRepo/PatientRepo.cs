using Application.Interfaces.Infrastructure.Postgres.PatientRepRep;
using Core.Domain.Entities;
using Infrastructure.Postgres.Scaffolding;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Postgres.Postgresql.Data.PatientRepo;

public class PatientRepo(MyDbContext context) : IPatientRep
{
    public async Task<Patient> GetPatientById(string patientId)
    {
        return await context.Patients.FirstOrDefaultAsync(p => p.Userid == patientId);
    }
}