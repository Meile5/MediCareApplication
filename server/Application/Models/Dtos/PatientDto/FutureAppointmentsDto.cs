using Core.Domain.Entities;

namespace Application.Models.Dtos.PatientDto;

public class FutureAppointmentsDto
{
    public string Id { get; set; } = null!;
    public DateTime StartTime { get; set; }
    public DateTime EndTime { get; set; }
    public string Status { get; set; } = null!;
    
    public string Notes { get; set; } = null!;
    
    public static FutureAppointmentsDto FromEntity(Appointment appointment)
    {
        return new FutureAppointmentsDto()
        {
            Id = appointment.Id,
            StartTime = appointment.StartTime,
            EndTime = appointment.EndTime,
            Status = appointment.Status,
            Notes = appointment.Notes
            
        };
    }
    
    
}