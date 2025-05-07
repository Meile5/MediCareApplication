using Application.Interfaces;
using Application.Interfaces.Infrastructure.Websocket;
using Application.Models.Dtos;
using Microsoft.AspNetCore.Mvc;

namespace Api.Rest.Controllers;

[ApiController]
public class AuthController(ISecurityService securityService, IConnectionManager connectionManager) : ControllerBase
{

    public const string RegisterPatientRoute = nameof(RegisterPatient);
    public const string RegisterDoctorRoute = nameof(RegisterDoctor);


    public const string LoginRoute =  nameof(Login);
    [HttpPost]
    [Route(LoginRoute)]
    public ActionResult<AuthResponseDto> Login([FromBody] AuthRequestDto dto)
    {
        return Ok(securityService.Login(dto));
    }

    public const string AuthWithJwtRoute = nameof(AuthWithJwt);

    [HttpGet]
    [Route(AuthWithJwtRoute)]
    public ActionResult AuthWithJwt([FromHeader]string authorization, string clientId)
    {
        securityService.VerifyJwtOrThrow(authorization);
        connectionManager.AddToTopic("teacher", clientId);
        return Ok();
    }
   
    [HttpPost]
    [Route(RegisterPatientRoute)]
    public ActionResult<AuthResponseDto> RegisterPatient([FromBody] PatientRegisterRequestDto dto)
    {
        return Ok(securityService.RegisterPatient(dto));
    }

    [HttpPost]
    [Route(RegisterDoctorRoute)]
    public ActionResult<AuthResponseDto> RegisterDoctor([FromBody] DoctorRegisterRequestDto dto)
    {
        return Ok(securityService.RegisterDoctor(dto));
    }
}