using Core.Domain.Entities;

namespace Application.Interfaces.Infrastructure.Postgres.VitalsRep;

public interface IVitalsRep
{
    Task SaveVitalsAsync(PatientVital vitals);
    Task<List<PatientVital>> GetVitalsForPatientAsync(string patientId, DateTime? since = null);
    Task AssignDeviceToPatient(string deviceId, string patientId);
}
