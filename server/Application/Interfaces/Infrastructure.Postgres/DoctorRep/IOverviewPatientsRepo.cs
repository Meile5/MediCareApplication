using Core.Domain.Entities;

namespace Application.Interfaces.Infrastructure.Postgres.DoctorRep;

public interface IOverviewPatientsRepo
{
    Task<List<PatientVital>> RetrievePatientsVitals(string patientId);
    Task<List<Diagnosis>> RetrieveDiagnoses(string patientId);
    Task<List<Patient>> RetrievePatients(string clinicId);
    Task<Diagnosis> SaveNewDiagnosis(Diagnosis toEntity);
}