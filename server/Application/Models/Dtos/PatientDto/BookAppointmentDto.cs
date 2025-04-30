using Application.Models.Enums;
using Core.Domain.Entities;

namespace Application.Models.Dtos.PatientDto;

public class BookAppointmentDto
{
    public DateTime StartTime { get; set; }
    public DateTime EndTime { get; set; }
    public string PatientId { get; set; } = null!;
    public string DoctorId { get; set; } = null!;
    
    public static  Appointment ToEntity(BookAppointmentDto appointment)
    {
        return new Appointment()
        {
            Id = Guid.NewGuid().ToString(),
            StartTime = appointment.StartTime,
            EndTime = appointment.EndTime,
            PatientId = appointment.PatientId,
            DoctorId = appointment.DoctorId,
            Status = Status.Pending
            
        };
    }
}