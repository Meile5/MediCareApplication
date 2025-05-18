using Application.Interfaces;
using Application.Interfaces.IDoctorService;
using Application.Models.Dtos.DoctorDto.requests;
using Microsoft.AspNetCore.Mvc;

namespace Api.Rest.Controllers.Doctor;

[ApiController]
public class AppointmentController(IAppointmentService appointmentService, ISecurityService securityService) : ControllerBase
{
    [Route("appointments/getAppointments")]
    [HttpGet]
    public async Task<ActionResult> GetAppoinmentsForDoctor([FromQuery] DoctorIdRequest doctorIdRequest, [FromHeader] string authorization)
    {
        string doctorId = doctorIdRequest.doctorId;
        var appointments = await appointmentService.RetrieveDoctorAppointments(doctorId);
        securityService.VerifyJwtOrThrow(authorization);
        return Ok(appointments);
    }

    [Route("appointments/confirm")]
    [HttpPut]
    public async Task<ActionResult> ConfirmAppointment([FromQuery] AppointmentIdRequest appointmentIdRequest, [FromHeader] string authorization)
    {
        securityService.VerifyJwtOrThrow(authorization);
        await appointmentService.ConfirmAppointment(appointmentIdRequest.appointmentId);
        return Ok();
    }

    [Route("appointments/reject")]
    [HttpPut]
    public async Task<ActionResult> RejectAppointment([FromQuery] AppointmentIdRequest appointmentIdRequest, [FromHeader] string authorization)
    {
        securityService.VerifyJwtOrThrow(authorization);
        await appointmentService.RejectAppointment(appointmentIdRequest.appointmentId);
        return Ok();
    }

}

public class AppointmentIdRequest
{
    public string appointmentId { get; set; }
}