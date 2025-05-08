
using Core.Domain.Entities;

namespace Application.Interfaces.IPatientService;

public interface IPatientService{
    Task<Patient> GetPatientFromDb(string patientId);

}