using WebSocketBoilerplate;
namespace Application.Models.Dtos.DoctorDto.response;


public class CancelledAppointment : BaseDto
{
    public string AppointmentId { get; set; } = null!;
}