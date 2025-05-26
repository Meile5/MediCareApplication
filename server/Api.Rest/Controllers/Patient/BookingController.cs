using Application.Interfaces;
using Application.Interfaces.IPatientService;
using Application.Models.Dtos.PatientDto;
using Application.Models.Dtos.PatientDto.request;
using Application.Models.Dtos.PatientDto.response;
using Core.Domain.Entities;
using Microsoft.AspNetCore.Mvc;

namespace Api.Rest.Controllers.Patient;
[ApiController]
public class BookingController (IBookingService bookingService, ISecurityService securityService) : ControllerBase

{
    public const string RetrieveBookingInfoRoute = nameof(RetrieveBookingInfo);
    
    [Route(RetrieveBookingInfoRoute)]
    [HttpGet]
    public async Task <ActionResult<AvailabilityDto> >RetrieveBookingInfo([FromQuery] string doctorId, [FromHeader]string authorization) 
    
    { 
        securityService.VerifyJwtOrThrow(authorization);
       var response = await bookingService.RetrieveBookingInfo(doctorId);
        return Ok(response);
    }

    public const string BookAppointmentRoute = nameof(BookAppointment);

    [Route(BookAppointmentRoute)]
    [HttpPost]
    public async Task<ActionResult> BookAppointment([FromBody] BookAppointmentRequest dto, [FromHeader]string authorization)
    {
        securityService.VerifyJwtOrThrow(authorization);
        await bookingService.BookAppointment(dto.Appointment);
        
        return Ok();
    }
    
    public const string RetrieveFutureAppointmentsRoute = nameof(RetrieveFutureAppointments);
    
    [Route(RetrieveFutureAppointmentsRoute)]
    [HttpGet]
    public async Task <ActionResult<List<FutureAppointmentsDto>>> RetrieveFutureAppointments([FromQuery] string userId, [FromHeader]string authorization) 
    
    {
        securityService.VerifyJwtOrThrow(authorization);
        var response = await bookingService.RetrieveFutureAppointments(userId);
        return Ok(response);
    }
    
    public const string RetrievePastAppointmentsRoute = nameof(RetrievePastAppointments);
    
    [Route(RetrievePastAppointmentsRoute)]
    [HttpGet]
    public async Task <ActionResult<List<PastAppointmentsDto>>> RetrievePastAppointments([FromQuery] string userId, [FromHeader]string authorization) 
    
    {
        securityService.VerifyJwtOrThrow(authorization);
        var response = await bookingService.RetrievePastAppointments(userId);
        return Ok(response);
    }
    
    public const string CancelAppointmentRoute = nameof(CancelAppointment);
    
    [Route(CancelAppointmentRoute)]
    [HttpDelete]
    public async Task <ActionResult> CancelAppointment([FromBody] CancelAppointmentDto dto, [FromHeader]string authorization) 
    
    {
        securityService.VerifyJwtOrThrow(authorization);
        await bookingService.CancelAppointment(dto);
        return Ok();
    }
    
    public const string RetrieveDoctorsRoute = nameof(RetrieveDoctors);
    
    [Route(RetrieveDoctorsRoute)]
    [HttpGet]
    public async Task <ActionResult<List<ClinicDoctorDto>>> RetrieveDoctors([FromQuery] string clinicId, [FromHeader]string authorization) 
    
    {
        securityService.VerifyJwtOrThrow(authorization);
        var response = await bookingService.RetrieveClinicDoctors(clinicId);
        return Ok(response);
    }
    
    


}