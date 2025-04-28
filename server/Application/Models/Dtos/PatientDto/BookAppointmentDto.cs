using Core.Domain.Entities;

namespace Application.Models.Dtos.PatientDto;

public class BookAppointmentDto
{
    public string Id { get; set; } = null!;

    public DateTime? CreatedAt { get; set; }
    public DateTime StartTime { get; set; }

    public DateTime EndTime { get; set; }
    public string PatientId { get; set; } = null!;
    public string DoctorId { get; set; } = null!;
    
    public static  Appointment ToEntity(BookAppointmentDto appointment)
    {
        return new Appointment()
        {
            Id = new Guid().ToString(),
            StartTime = appointment.StartTime,
            EndTime = appointment.EndTime,
            PatientId = appointment.PatientId,
            DoctorId = appointment.DoctorId,
            
        };
    }
}