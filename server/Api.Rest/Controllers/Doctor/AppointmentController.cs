using Api.Rest.Controllers.Chat;
using Application.Interfaces;
using Application.Interfaces.IChatService;
using Application.Interfaces.IDoctorService;
using Application.Models.Dtos.ChatDtos;
using Application.Models.Dtos.DoctorDto.requests;
using Microsoft.AspNetCore.Mvc;

namespace Api.Rest.Controllers.Doctor;

[ApiController]
public class AppointmentController(IAppointmentService appointmentService, IChatService chatService, ISecurityService securityService) : ControllerBase
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
    public async Task<ActionResult> ConfirmAppointment([FromQuery] AppointmentIdRequest appointmentIdRequest, [FromQuery] string roomId, [FromHeader] string authorization)
    {
        securityService.VerifyJwtOrThrow(authorization);
        await appointmentService.ConfirmAppointment(appointmentIdRequest.appointmentId, roomId);
        return Ok();
    }

    [Route("appointments/confirm/createChatRoom")]
    [HttpPost]
   public async Task<ActionResult> CreateChatRoom([FromBody] CreateChatRoomDto chatRoomDto, [FromHeader]string authorization){
        await chatService.CreateChatRoom(chatRoomDto);
        securityService.VerifyJwtOrThrow(authorization);
        return Ok();
    }

    [Route("appointments/reject")]
    [HttpPut]
    public async Task<ActionResult> RejectAppointment([FromQuery] AppointmentIdRequest appointmentIdRequest, [FromQuery] string doctorId, [FromHeader] string authorization)
    {
        securityService.VerifyJwtOrThrow(authorization);
    
        await appointmentService.RejectAppointment(appointmentIdRequest.appointmentId, doctorId);
        return Ok();
    }
    
    [Route("appointments/getPatientName")]
    [HttpGet]
    public async Task<ActionResult> GetPatientsNameForAppointment([FromQuery] AppointmentIdRequest appointmentIdRequest, [FromHeader] string authorization)
    {
        string appointmentId = appointmentIdRequest.appointmentId;
        var patientName = await appointmentService.GetPatientName(appointmentId);
        securityService.VerifyJwtOrThrow(authorization);
        return Ok(patientName);
    }



}

public class AppointmentIdRequest
{
    public string appointmentId { get; set; }
}
