using System.ComponentModel.DataAnnotations;

namespace Application.Models.Dtos;

public class PatientRegisterRequestDto : AuthRequestDto
{
    [Required] public string Name { get; set; } = null!;
    [Required] public string Surname { get; set; } = null!;
    [Required] public string Gender { get; set; } = null!;
    [Required] public string Age { get; set; } = null!;
    [Required] public string Bloodtype { get; set; } = null!;
    public string? Allergies { get; set; }
    [Required] public string Phonenumber { get; set; } = null!;
    [Required] public string Address { get; set; } = null!;
    public string? DeviceId { get; set; }
}
