using Application.Interfaces.IDoctorService;
using Application.Interfaces.Infrastructure.Postgres.DoctorRep;
using Application.Models.Dtos.DoctorDto.requests;
using Application.Models.Dtos.DoctorDto.response;

namespace Application.Services.DoctorService;

public class OverviewPatientsService (IOverviewPatientsRepo overviewRepo): IOverviewPatientsService
{
    public async Task<List<VitalsSignsDto>> RetrieveVitalSigns(string patientId)
    {
        var vitals = await overviewRepo.RetrievePatientsVitals(patientId);
        var vitalsDto = vitals
            .Select(VitalsSignsDto.FromEntity)
            .ToList();
        return vitalsDto;

    }

    public async Task<List<DiagnosesDto>> RetrieveDiagnoses(string patientId)
    {
        var diagnoses = await overviewRepo.RetrieveDiagnoses(patientId);
        var diagnosesDto = diagnoses
            .Select(DiagnosesDto.FromEntity)
            .ToList();
        return diagnosesDto;
    }

    public async Task<List<PatientDto>> RetrievePatients(string clinicId)
    {
        var patients = await overviewRepo.RetrievePatients(clinicId);
        var patientDto = patients
            .Select(PatientDto.FromEntity)
            .ToList();
        return patientDto;
    }

    public async Task<DiagnosesDto> SaveNewDiagnosis(NewDiagnosisDto dto)
    {
        var saveDiagnosis = await overviewRepo.SaveNewDiagnosis(NewDiagnosisDto.ToEntity(dto));
        var diagnosisDto = DiagnosesDto.FromEntity(saveDiagnosis);
        return diagnosisDto;
    }
}