using Application.Interfaces.IPatientService;
using Application.Models.Dtos.PatientDto;
using Core.Domain.Entities;
using Microsoft.AspNetCore.Mvc;

namespace Api.Rest.Controllers.Patient;
[ApiController]
public class BookingController (IBookingService _bookingService) : ControllerBase

{
    public const string RetrieveBookingInfoRoute = nameof(RetrieveBookingInfo);
    
    [Route(RetrieveBookingInfoRoute)]
    public async Task <ActionResult<DoctorAvailabilityResponseDto> >RetrieveBookingInfo([FromBody] string doctorId) 
    
    {
       // securityService.VerifyJwtOrThrow(authorization);
       var response = await _bookingService.RetrieveBookingInfo(doctorId);
        return Ok(response);
    }

    public const string BookAppointmentRoute = nameof(BookAppointment);

    [Route(BookAppointmentRoute)]
    public async Task<ActionResult> BookAppointment([FromBody] BookAppointmentDto dto)
    {
        await _bookingService.BookAppointment(dto);
        return Ok();
    }


}