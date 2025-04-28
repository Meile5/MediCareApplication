namespace Application.Models.Dtos.PatientDto;

public class DoctorAvailabilityResponseDto
{
    public string? DoctorId { get; set; }
    public string? DoctorName { get; set; }
    public List<AvailabilityDto> AvailableDates { get; set; }
   // public List<ExceptionDTO> Exceptions { get; set; }
    public List<AppointmentDto> Appointments { get; set; }
}