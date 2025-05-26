using WebSocketBoilerplate;
namespace Application.Models.Dtos.DoctorDto.requests;

public class DoctorCancelAppointment : BaseDto
{
    public string AppointmentId { get; set; } = null!;
}