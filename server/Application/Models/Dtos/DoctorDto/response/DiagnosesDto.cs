using Core.Domain.Entities;

namespace Application.Models.Dtos.DoctorDto.response;

public class DiagnosesDto
{

    public string PatientDiagnosis { get; set; } = null!;
    public string? Treatment { get; set; }

    public DateTime? Date { get; set; } 

    public static  DiagnosesDto FromEntity(Diagnosis diagnosis)
    {
        return new DiagnosesDto()
        {
            PatientDiagnosis = diagnosis.PatientDiagnosis,
            Treatment = diagnosis.Treatment,
            Date = diagnosis.Date
            
        };
    }
}