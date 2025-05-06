using Application.Interfaces.Infrastructure.Postgres.VitalsRep;
using Core.Domain.Entities;
using Infrastructure.Postgres.Scaffolding;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Postgres.Postgresql.Data.VitalsRepo;

public class VitalsRepo(MyDbContext context) : IVitalsRep
{
    public async Task SaveVitalsAsync(PatientVital vitals)
    {
        try
        {
            await context.PatientVitals.AddAsync(vitals);
            await context.SaveChangesAsync();
        }
        catch (Exception e)
        {
            Console.WriteLine($"Error saving vitals: {e}");
        }
    }

    public async Task<List<PatientVital>> GetVitalsForPatientAsync(string patientId, DateTime? since = null)
    {
        var query = context.PatientVitals.Where(v => v.PatientId == patientId);

        if (since.HasValue)
        {
            query = query.Where(v => v.CreatedAt >= since.Value);
        }

        return await query.OrderByDescending(v => v.CreatedAt).ToListAsync();
    }
}
