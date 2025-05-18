using Application.Interfaces;
using Application.Interfaces.IDoctorService;
using Application.Interfaces.IPatientService;
using Application.Models.Dtos.DoctorDto.requests;
using Microsoft.AspNetCore.Mvc;

namespace Api.Rest.Controllers.Doctor;
[ApiController]
public class DoctorController(IDoctorService doctorService, ISecurityService securityService) : ControllerBase{
    [Route("doctor/getDoctor")]
    [HttpGet]
    public async Task<ActionResult> GetDoctorById([FromQuery] DoctorIdRequest doctorIdRequest, [FromHeader]string authorization){
        string doctorId = doctorIdRequest.doctorId;
        var doctor = await doctorService.GetDoctorFromDb(doctorId);
        securityService.VerifyJwtOrThrow(authorization);
        return Ok(doctor);
    }

}

