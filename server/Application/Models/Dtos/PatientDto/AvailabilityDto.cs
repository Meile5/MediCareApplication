using Core.Domain.Entities;

namespace Application.Models.Dtos.PatientDto;

public class AvailabilityDto
{
      
    public DateTime StartTime { get; set; }
    public DateTime EndTime { get; set; }
    
   /* public static  AvailabilityDto FromEntity(DoctorAvailability availability)
    {
        return new AvailabilityDto()
        {
            
            StartTime = availability.StartTime,
            EndTime = availability.EndTime,
            
        };
    }*/
 
}