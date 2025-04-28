// Application/Dtos/DeviceVitalsDto.cs
namespace Application.Models.Dtos;

public class DeviceVitalsDto
{
    public string EventType { get; set; } = "DeviceVitals"; 
    public string UserId { get; set; } = null!;              
    public string DeviceId { get; set; } = null!;
    public double Temperature { get; set; }
}
