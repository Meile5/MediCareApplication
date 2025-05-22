using Application.Interfaces.Infrastructure.Postgres.PatientRepRep;
using Application.Interfaces.IPatientService;
using Core.Domain.Entities;
namespace Application.Services.PatientService;

public class PatientService(IPatientRep patientRep) : IPatientService
{
    public async Task<Patient> GetPatientFromDb(string patientId)
    {
        return await patientRep.GetPatientById(patientId);
    }

    public async Task PairDevice(string patientId, string deviceId)
    {
        await patientRep.PairDeviceWithPatient(patientId, deviceId);
    }
}