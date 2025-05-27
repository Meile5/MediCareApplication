using WebSocketBoilerplate;

namespace Application.Models.Dtos.DoctorDto.response;

public class ApprovedAppointment : BaseDto
{
    public string AppointmentId { get; set; } = null!;
}