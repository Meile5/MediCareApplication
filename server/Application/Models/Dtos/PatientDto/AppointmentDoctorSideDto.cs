using WebSocketBoilerplate;

namespace Application.Models.Dtos.PatientDto;

public class BroadcastBookedSlotDto : BaseDto
{
    public string Id { get; set; } = null!;

    public string DoctorId { get; set; } = null!;

    public string PatientId { get; set; } = null!;

    public string Status { get; set; } = null!;

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public DateTime StartTime { get; set; }

    public DateTime EndTime { get; set; }

 

   
}