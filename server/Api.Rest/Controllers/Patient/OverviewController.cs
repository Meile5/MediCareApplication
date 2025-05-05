using Application.Interfaces.IPatientService;
using Application.Models.Dtos.PatientDto.response;
using Microsoft.AspNetCore.Mvc;

namespace Api.Rest.Controllers.Patient;

public class OverviewController(IOverviewService _overviewService)  : ControllerBase
{
    
    public const string RetrieveClinicInfoRoute= nameof(RetrieveClinicInfo);
    
    [Route(RetrieveClinicInfoRoute)]
    public async Task <ActionResult<List<ClinicInfoDto>>>RetrieveClinicInfo([FromBody] string userId) 
    
    {
        // securityService.VerifyJwtOrThrow(authorization);
        var response = await _overviewService.RetrieveClinicInfo(userId);
        return Ok(response);
    }
    
}