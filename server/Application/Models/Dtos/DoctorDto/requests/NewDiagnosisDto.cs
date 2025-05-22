using Core.Domain.Entities;

namespace Application.Models.Dtos.DoctorDto.requests;

public class NewDiagnosisDto
{
    public string PatientDiagnosis { get; set; } = null!;

    public string PatientId { get; set; } = null!;

    public string? Treatment { get; set; }

    public string DoctorId { get; set; } = null!;
    
    
    public static  Diagnosis ToEntity(NewDiagnosisDto diagnosis)
    {
        return new Diagnosis()
        {
            Id = Guid.NewGuid().ToString(),
            PatientDiagnosis = diagnosis.PatientDiagnosis,
            Idpatient = diagnosis.PatientId,
            Iddoctor = diagnosis.DoctorId,
            Treatment = diagnosis.Treatment,
            Date = DateTime.UtcNow
            
        };
    }
}