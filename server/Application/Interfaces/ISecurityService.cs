using Application.Models;
using Application.Models.Dtos;

namespace Application.Interfaces;

public interface ISecurityService
{
    public string HashPassword(string password);
    public AuthResponseDto Login(AuthRequestDto dto);
    public JwtClaims VerifyJwtOrThrow(string jwt);
    AuthResponseDto RegisterPatient(PatientRegisterRequestDto dto);
    AuthResponseDto RegisterDoctor(DoctorRegisterRequestDto dto);

}