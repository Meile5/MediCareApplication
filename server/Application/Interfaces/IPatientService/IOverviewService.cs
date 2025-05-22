using Application.Models.Dtos.PatientDto.response;

namespace Application.Interfaces.IPatientService;

public interface IOverviewService
{
    Task<List<ClinicInfoDto>> RetrieveClinicInfo(string userId);
    Task<List<ClinicInfoDto>> RetrieveClinicInfoDoctor(string userId);

}