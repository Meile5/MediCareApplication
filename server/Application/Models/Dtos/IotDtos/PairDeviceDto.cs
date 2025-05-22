using System.ComponentModel.DataAnnotations;

namespace Application.Models.Dtos;

public class PairDeviceDto {
    [Required]
    public string PatientId {get;set;}
    [Required]
    public string DeviceId{get;set;}
}