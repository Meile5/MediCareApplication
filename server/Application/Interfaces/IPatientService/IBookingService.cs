using Application.Models.Dtos.ChatDtos;
using Application.Models.Dtos.PatientDto;
using Application.Models.Dtos.PatientDto.response;

namespace Application.Interfaces.IPatientService;

public interface IBookingService
{
     Task<DoctorAvailabilityResponseDto> RetrieveBookingInfo(string doctorId);

     Task BookAppointment(BookAppointmentDto dto, CreateChatRoomDto dtoChatRoom);
     Task<List<FutureAppointmentsDto>> RetrieveFutureAppointments(string userId);
     Task <List<PastAppointmentsDto>> RetrievePastAppointments(string userId);
     Task CancelAppointment(CancelAppointmentDto dto);
     Task<List<ClinicDoctorDto>> RetrieveClinicDoctors(string clinicId);
}