using Core.Domain.Entities;

namespace Application.Interfaces.Infrastructure.Postgres.PatientRep;

public interface IOverviewRepo
{
    Task<List<Clinic>> RetrieveClinicInfo(string userId);
    Task<List<Clinic>> RetrieveClinicInfoForDoctor(string userId);
}