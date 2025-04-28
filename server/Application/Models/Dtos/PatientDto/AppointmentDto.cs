using Core.Domain.Entities;

namespace Application.Models.Dtos.PatientDto;

public class AppointmentDto
{
    
    public string Id { get; set; } = null!;

    public DateTime? CreatedAt { get; set; }
    public DateTime? StartTime { get; set; }

    public DateTime? EndTime { get; set; }
   
    
    public static  AppointmentDto FromEntity(Appointment appointment)
    {
        return new AppointmentDto()
        {
            Id = appointment.Id,
            StartTime = appointment.StartTime,
            EndTime = appointment.EndTime,
            
        };
    }
   
}