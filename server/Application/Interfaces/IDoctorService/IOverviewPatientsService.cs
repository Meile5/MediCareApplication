using Application.Models.Dtos.DoctorDto.response;

namespace Application.Interfaces.IDoctorService;

public interface IOverviewPatientsService
{
    Task<List<VitalsSignsDto>> RetrieveVitalSigns(string patientId);
    Task<List<DiagnosesDto>> RetrieveDiagnoses(string patientId);
    Task<List<PatientDto>> RetrievePatients(string clinicId);
}