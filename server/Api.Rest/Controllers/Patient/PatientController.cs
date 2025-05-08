using Application.Interfaces;
using Application.Interfaces.IPatientService;
using Microsoft.AspNetCore.Mvc;

namespace Api.Rest.Controllers.Patient;
[ApiController]
public class PatientController(IPatientService patientService, ISecurityService securityService) : ControllerBase{
    [Route("patient/getPatient")]
    [HttpPost]
    public async Task<ActionResult> GetPatientById([FromBody] PatientIdRequest patientIdRequest, [FromHeader]string authorization){
        string patientId = patientIdRequest.patientId;
        var patient = await patientService.GetPatientFromDb(patientId);
        securityService.VerifyJwtOrThrow(authorization);
        return Ok(patient);
    }

}

public class PatientIdRequest
{
    public string patientId { get; set; }
}