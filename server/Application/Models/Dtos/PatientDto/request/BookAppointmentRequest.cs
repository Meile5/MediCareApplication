using Application.Models.Dtos.ChatDtos;

namespace Application.Models.Dtos.PatientDto.request;

public class BookAppointmentRequest
{
    public BookAppointmentDto Appointment { get; set; }
    public CreateChatRoomDto ChatRoom { get; set; }
}