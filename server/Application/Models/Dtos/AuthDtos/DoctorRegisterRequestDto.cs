using System.ComponentModel.DataAnnotations;

namespace Application.Models.Dtos;

public class DoctorRegisterRequestDto : AuthRequestDto
{
    [Required] public string Name { get; set; } = null!;
    [Required] public string Surname { get; set; } = null!;
    public string? Age { get; set; }
    public string? Gender { get; set; }
    [Required] public string Specialty { get; set; } = null!;
}
