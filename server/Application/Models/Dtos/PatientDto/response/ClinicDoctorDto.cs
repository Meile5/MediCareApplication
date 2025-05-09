using Core.Domain.Entities;

namespace Application.Models.Dtos.PatientDto.response;

public class ClinicDoctorDto
{
    public string DoctorId { get; set; }

    public string Name { get; set; }

    public string Surname { get; set; }
    
    public static  ClinicDoctorDto FromEntity(Doctor doctor)
    {
        return new ClinicDoctorDto()
        {
            DoctorId = doctor.Doctorid,
            Name = doctor.Name,
            Surname = doctor.Surname,
            
        };
    }
}