using Core.Domain.Entities;

namespace Application.Interfaces.Infrastructure.Postgres.PatientRepRep;

public interface IPatientRep{
    Task<Patient> GetPatientById(string patientId);
    Task PairDeviceWithPatient(string patientId, string deviceId);
}