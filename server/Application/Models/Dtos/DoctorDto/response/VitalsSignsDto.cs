using Core.Domain.Entities;

namespace Application.Models.Dtos.DoctorDto.response;

public class VitalsSignsDto
{

    public decimal? OxygenLevel { get; set; }

    public decimal? BodyTemperature { get; set; }

    public int? HeartRate { get; set; }

    public DateTime? CreatedAt { get; set; }
    
    public static  VitalsSignsDto FromEntity(PatientVital vital)
    {
        return new VitalsSignsDto()
        {
            OxygenLevel = vital.OxygenLevel,
            BodyTemperature = vital.BodyTemperature,
            HeartRate = vital.HeartRate,
            CreatedAt = vital.CreatedAt,
            
        };
    }


}