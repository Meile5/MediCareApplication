using Application.Interfaces;
using Application.Interfaces.IDoctorService;
using Application.Models.Dtos.DoctorDto.response;
using Microsoft.AspNetCore.Mvc;

namespace Api.Rest.Controllers.Doctor;
[ApiController]
public class OverviewPatientsController  (IOverviewPatientsService service, ISecurityService securityService) : ControllerBase
{
    public const string RetrievePatientsVitalsRoute = nameof(RetrievePatientsVitals);
    
    [Route(RetrievePatientsVitalsRoute)]
    [HttpGet]
    public async Task<ActionResult<List<VitalsSignsDto>>>RetrievePatientsVitals([FromQuery] string patientId /*[FromHeader]string authorization*/) 
    
    { 
        //securityService.VerifyJwtOrThrow(authorization);
        var response = await service.RetrieveVitalSigns(patientId);
        return Ok(response);
    }
    public const string RetrievePatientsDiagnosesRoute = nameof(RetrievePatientsDiagnoses);
    
    [Route(RetrievePatientsDiagnosesRoute)]
    [HttpGet]
    public async Task<ActionResult<List<DiagnosesDto>>>RetrievePatientsDiagnoses([FromQuery] string patientId /*[FromHeader]string authorization*/) 
    
    { 
       // securityService.VerifyJwtOrThrow(authorization);
        var response = await service.RetrieveDiagnoses(patientId);
        return Ok(response);
    }
    
    public const string RetrievePatientsRoute = nameof(RetrievePatients);
    
    [Route(RetrievePatientsRoute)]
    [HttpGet]
    public async Task<ActionResult<List<PatientDto>>>RetrievePatients([FromQuery] string clinicId /*[FromHeader]string authorization*/) 
    
    { 
       // securityService.VerifyJwtOrThrow(authorization);
        var response = await service.RetrievePatients(clinicId);
        return Ok(response);
    }


    
}