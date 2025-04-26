using System.ComponentModel.DataAnnotations;

namespace Application.Models.Dtos;

public class ClientWantsToPairDeviceDto {
    [Required]
    public string DeviceId {get;set;}
}