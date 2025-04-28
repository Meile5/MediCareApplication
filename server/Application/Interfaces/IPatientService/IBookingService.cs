using Application.Models.Dtos.PatientDto;

namespace Application.Interfaces.IPatientService;

public interface IBookingService
{
     Task<DoctorAvailabilityResponseDto> RetrieveBookingInfo(string doctorId);

     Task BookAppointment(BookAppointmentDto dto);
}