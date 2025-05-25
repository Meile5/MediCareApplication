using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace Application.Models.Dtos;

public class ClientWantsToPairDeviceDto {
    
    public string PatientId { get; set; }
    
    public string DeviceId { get; set; }
    
    public string PairingCode { get; set; }
}