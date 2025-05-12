
using System.Text.Json;
using Core.Domain.Entities;

namespace Application.Models.Dtos;

public class SaveVitalsDto
{
    public string PatientId { get; set; } = null!;              
    public decimal Temperature { get; set; }
    public List<int> Ecg { get; set; } = new();
    public decimal OxygenLevel { get; set; }
    public int HeartRate{ get; set; }

    




    public static PatientVital ToEntity(SaveVitalsDto saveVitalsDto){
        return new PatientVital{
            Id = Guid.NewGuid().ToString(),
            PatientId = saveVitalsDto.PatientId,
            OxygenLevel = saveVitalsDto.OxygenLevel,
            BodyTemperature = saveVitalsDto.Temperature,
            EcgSummary = JsonSerializer.Serialize(saveVitalsDto.Ecg),
            HeartRate = saveVitalsDto.HeartRate
        };
    }
}
