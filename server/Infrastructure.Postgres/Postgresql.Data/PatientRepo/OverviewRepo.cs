using Application.Interfaces.Infrastructure.Postgres.PatientRep;
using Application.Models.Dtos.PatientDto.response;
using Core.Domain.Entities;
using Infrastructure.Postgres.Scaffolding;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Postgres.Postgresql.Data.PatientRepo;

public class OverviewRepo(MyDbContext context) : IOverviewRepo
{
    public async Task<List<Clinic>> RetrieveClinicInfo(string userId)
    {
        var result = await context.ClinicPatients
            .Where((ClinicPatient cp) => cp.Idpatient == userId) 
            .Join(
                context.Clinics,
                cp => cp.Idclinic,
                c => c.Idclinic,
                (cp, c) => c
            )
            .ToListAsync();

        return result;
    }

}