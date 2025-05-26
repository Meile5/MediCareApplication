using Application;
using Application.Interfaces.Infrastructure.Postgres.DoctorRep;
using Core.Domain.Entities;
using Infrastructure.Postgres.Scaffolding;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Postgres.Postgresql.Data.DoctorRepo;

public class OverviewPatientsRepo (MyDbContext context, ILogger<OverviewPatientsRepo> logger): IOverviewPatientsRepo
{
    public async Task<List<PatientVital>> RetrievePatientsVitals(string patientId)
    {
        try
        {
            return await context.PatientVitals
                .Where(v => v.PatientId == patientId)
                .ToListAsync();
        }
        catch (Exception ex)
        {
            logger.LogError(ex, ErrorMessages.GetMessage(ErrorCode.PatientVitals));
            throw;
            
        }
    }

    public async Task<List<Diagnosis>> RetrieveDiagnoses(string patientId)
    {
        try
        {
            return await context.Diagnoses
                .Where(d => d.Idpatient == patientId)
                .ToListAsync();
        }
        catch (Exception ex)
        {
            logger.LogError(ex, ErrorMessages.GetMessage(ErrorCode.Diagnoses));
            throw;
        }
    }

    public async Task<List<Patient>> RetrievePatients(string clinicId)
    {
        try
        {
            var result = await context.ClinicPatients
                .Where(cp => cp.Idclinic == clinicId)
                .Join(
                    context.Patients,
                    cp => cp.Idpatient,
                    p => p.Userid,
                    (cp, p) => p
                )
                .ToListAsync();
        
            return result;
        }
        catch (Exception ex)
        {
            logger.LogError(ex, ErrorMessages.GetMessage(ErrorCode.Diagnoses));
            throw;
        }
        
        
        
    }

    public async Task<Diagnosis> SaveNewDiagnosis(Diagnosis diagnosis)
    {
        try
        {
            var savedDiagnosis = await context.Diagnoses
                .AddAsync(diagnosis);
            await context.SaveChangesAsync();
            return savedDiagnosis.Entity;
        }
        catch (Exception ex)
        {
            logger.LogError(ex, ErrorMessages.GetMessage(ErrorCode.Diagnosis));
            throw;
        }
        
    }
}