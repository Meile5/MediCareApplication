using Application;
using Application.Interfaces.Infrastructure.Postgres.PatientRep;
using Application.Models.Dtos.PatientDto.response;
using Core.Domain.Entities;
using Infrastructure.Postgres.Scaffolding;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Postgres.Postgresql.Data.PatientRepo;

public class OverviewRepo(MyDbContext context, Logger<OverviewRepo> logger) : IOverviewRepo
{
    public async Task<List<Clinic>> RetrieveClinicInfo(string userId)
    {
        try
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
        catch (Exception ex)
        {
            logger.LogError(ex, ErrorMessages.GetMessage(ErrorCode.ClinicInfo));
            throw;
        }


    }
    
    public async Task<List<Clinic>> RetrieveClinicInfoForDoctor(string userId)
    {
        var result = await context.ClinicDoctors
            .Where((ClinicDoctor cp) => cp.Iddoctor == userId) 
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