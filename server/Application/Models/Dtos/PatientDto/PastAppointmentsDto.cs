using Core.Domain.Entities;

namespace Application.Models.Dtos.PatientDto;

public class PastAppointmentsDto
{
    public DateTime StartTime { get; set; }
    public DateTime EndTime { get; set; }
    
    public string Notes { get; set; } = null!;

    
    
    public static PastAppointmentsDto FromEntity(Appointment appointment)
    {
        return new PastAppointmentsDto()
        {
            StartTime = appointment.StartTime,
            EndTime = appointment.EndTime,
            Notes = appointment.Notes
            
        };
    }
}