using WebSocketBoilerplate;

namespace Application.Models.Dtos.DoctorDto.response;

public class ConfirmedSlot : BaseDto
{
    public DateTime startTime { get; set; }
    public DateTime endTime{ get; set; }
}