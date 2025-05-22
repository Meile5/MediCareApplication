using Application.Interfaces.Infrastructure.Postgres.PatientRep;
using Application.Interfaces.IPatientService;
using Application.Models.Dtos.PatientDto;
using Application.Models.Dtos.PatientDto.response;

namespace Application.Services.PatientService;

public class OverviewService(IOverviewRepo _overviewRepo) : IOverviewService
{
    public async Task<List<ClinicInfoDto>> RetrieveClinicInfo(string userId)
    {
        var clinicInfo = await _overviewRepo.RetrieveClinicInfo(userId);
        var dto = clinicInfo
            .Select(ClinicInfoDto.FromEntity)
            .ToList();
        return dto;
    }

    public async Task<List<ClinicInfoDto>> RetrieveClinicInfoDoctor(string userId)
    {
        var clinicInfo = await _overviewRepo.RetrieveClinicInfoForDoctor(userId);
        var dto = clinicInfo
            .Select(ClinicInfoDto.FromEntity)
            .ToList();
        return dto;
    }
}