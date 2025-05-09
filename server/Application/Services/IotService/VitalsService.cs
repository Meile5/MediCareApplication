using Application.Interfaces.Infrastructure.Postgres.VitalsRep;
using Application.Models.Dtos;

public class VitalsService(IVitalsRep vitalsRep) : IVitalsService
{
    public async Task SaveVitals(SaveVitalsDto saveVitalsDto)
    {
        var vitals = SaveVitalsDto.ToEntity(saveVitalsDto);
        await vitalsRep.SaveVitalsAsync(vitals);
    }
} 