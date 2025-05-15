using Application.Interfaces;
using Application.Interfaces.IPatientService;
using Application.Models.Dtos;
using Microsoft.AspNetCore.Mvc;

namespace Api.Rest.Controllers.Patient;
[ApiController]
public class PatientController(IPatientService patientService, ISecurityService securityService) : ControllerBase{
    [Route("patient/getPatient")]
    [HttpGet]
    public async Task<ActionResult> GetPatientById([FromQuery] PatientIdRequest patientIdRequest, [FromHeader]string authorization){
        string patientId = patientIdRequest.patientId;
        var patient = await patientService.GetPatientFromDb(patientId);
        securityService.VerifyJwtOrThrow(authorization);
        return Ok(patient);
    }

    [Route("patient/device/pair")]
    [HttpPut]
    public async Task<IActionResult> PairDevice([FromBody] PairDeviceDto request, [FromHeader]string authorization){
        await patientService.PairDevice(request.PatientId, request.DeviceId);
        securityService.VerifyJwtOrThrow(authorization);
        return Ok(new 
        { 
            message = $"Assigned DeviceId {request.DeviceId} to patient {request.PatientId}successfully."
        });
    }

}

public class PatientIdRequest
{
    public string patientId { get; set; }
}