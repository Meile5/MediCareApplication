using Application.Interfaces.Infrastructure.Postgres.VitalsRep;
using Application.Models.Dtos;

public class VitalsService(IVitalsRep vitalsRep) : IVitalsService
{
    public async Task PairDevice(string deviceId, string patientId)
    {
        await vitalsRep.AssignDeviceToPatient(deviceId, patientId);
    }

    public async Task SaveVitals(SaveVitalsDto saveVitalsDto)
    {
        var vitals = SaveVitalsDto.ToEntity(saveVitalsDto);
        await vitalsRep.SaveVitalsAsync(vitals);
    }
} 