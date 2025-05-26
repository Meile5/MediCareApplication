using Application.Models.Dtos;
namespace Application.Models.Dtos;

public interface IVitalsService
{
    public Task SaveVitals(SaveVitalsDto saveVitalsDto);
    public Task PairDevice(string deviceId, string patientId);
}