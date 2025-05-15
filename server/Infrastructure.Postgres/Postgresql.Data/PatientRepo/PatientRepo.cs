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

    public async Task PairDeviceWithPatient(string patientId, string deviceId)
    {
        var patient = await context.Patients.FirstOrDefaultAsync(p => p.Userid == patientId);
        if (patient == null)
        {
            throw new InvalidOperationException("Patient not found.");
        }

        patient.DeviceId = deviceId;
        context.Patients.Update(patient);
        await context.SaveChangesAsync();
    }
}