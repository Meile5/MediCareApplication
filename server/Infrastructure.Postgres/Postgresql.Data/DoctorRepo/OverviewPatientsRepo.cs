using Application.Interfaces.Infrastructure.Postgres.DoctorRep;
using Core.Domain.Entities;
using Infrastructure.Postgres.Scaffolding;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Postgres.Postgresql.Data.DoctorRepo;

public class OverviewPatientsRepo (MyDbContext context): IOverviewPatientsRepo
{
    public async Task<List<PatientVital>> RetrievePatientsVitals(string patientId)
    {
        return await context.PatientVitals
            .Where(v => v.PatientId == patientId)
            .ToListAsync();
    }

    public async Task<List<Diagnosis>> RetrieveDiagnoses(string patientId)
    {
        return await context.Diagnoses
            .Where(d => d.Idpatient == patientId)
            .ToListAsync();
    }

    public async Task<List<Patient>> RetrievePatients(string clinicId)
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
}