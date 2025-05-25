using Application;
using Application.Interfaces.Infrastructure.Postgres.VitalsRep;
using Core.Domain.Entities;
using Infrastructure.Postgres.Scaffolding;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Postgres.Postgresql.Data.VitalsRepo;

public class VitalsRepo(MyDbContext context, ILogger<VitalsRepo> logger) : IVitalsRep
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
            logger.LogError(e, ErrorMessages.GetMessage(ErrorCode.SaveVitals));
        }
    }

    public async Task<List<PatientVital>> GetVitalsForPatientAsync(string patientId, DateTime? since = null)
    {
        try
        {
            var query = context.PatientVitals.Where(v => v.PatientId == patientId);

            if (since.HasValue)
            {
                query = query.Where(v => v.CreatedAt >= since.Value);
            }

            return await query.OrderByDescending(v => v.CreatedAt).ToListAsync();
        }
        catch (Exception e)
        {
            logger.LogError(e, ErrorMessages.GetMessage(ErrorCode.PatientVitals));
            throw;
        }
    }
}
