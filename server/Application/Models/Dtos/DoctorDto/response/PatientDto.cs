using Core.Domain.Entities;

namespace Application.Models.Dtos.DoctorDto.response;

public class PatientDto
{
    public string Userid { get; set; } = null!;

    public string Name { get; set; } = null!;

    public string Surname { get; set; } = null!;

    public string Gender { get; set; } = null!;

    public string Age { get; set; } = null!;

    public string Bloodtype { get; set; } = null!;

    public string? Allergies { get; set; }

    public string Phonenumber { get; set; } = null!;

    public string Address { get; set; } = null!;
    
    public static  PatientDto FromEntity(Patient vital)
    {
        return new PatientDto()
        {
            Userid = vital.Userid,
            Name = vital.Name,
            Gender = vital.Gender,
            Age = vital.Age,
            Bloodtype = vital.Bloodtype,
            Allergies = vital.Allergies,
            Phonenumber = vital.Phonenumber,
            Address = vital.Address,
            Surname = vital.Surname,
            
        };
    }
}