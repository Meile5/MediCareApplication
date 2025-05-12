using Application.Interfaces;
using Application.Interfaces.IPatientService;
using Application.Models.Dtos.PatientDto.response;
using Microsoft.AspNetCore.Mvc;

namespace Api.Rest.Controllers.Patient;

public class OverviewController(IOverviewService overviewService, ISecurityService securityService)  : ControllerBase
{
    
    public const string RetrieveClinicInfoRoute= nameof(RetrieveClinicInfo);
    
    [Route(RetrieveClinicInfoRoute)
    ]
    [HttpGet]
    public async Task <ActionResult<List<ClinicInfoDto>>>RetrieveClinicInfo([FromQuery] string userId, [FromHeader]string authorization) 
    
    {
        securityService.VerifyJwtOrThrow(authorization);
        var response = await overviewService.RetrieveClinicInfo(userId);
        return Ok(response);
    }
    
    public const string RetrieveDiagnosesRoute= nameof(RetrieveDiagnoses);
    [Route(RetrieveDiagnosesRoute)]
    public async Task <ActionResult<List<ClinicInfoDto>>>RetrieveDiagnoses([FromBody] string userId, [FromHeader]string authorization) 
    
    {
        securityService.VerifyJwtOrThrow(authorization);
        var response = await overviewService.RetrieveClinicInfo(userId);
        return Ok(response);
    }
    
    

    
}