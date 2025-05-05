using Core.Domain.Entities;

namespace Application.Models.Dtos.PatientDto.response;

public class ClinicInfoDto
{
    public string Clinicname { get; set; } = null!;

    public string Address { get; set; } = null!;

    public string Phonenumber { get; set; } = null!;
    
    public string Type { get; set; } = null!;
    
    public List<DoctorInfoDto> Doctor { get; set; } = null!;
    
    public static  ClinicInfoDto FromEntity(Clinic clinicInfo)
    {
        return new ClinicInfoDto()
        {
            Clinicname = clinicInfo.Clinicname,
            Address = clinicInfo.Address,
            Phonenumber = clinicInfo.Phonenumber,
            Type = clinicInfo.Type,
            //Doctor = clinicInfo.ClinicDoctors.ToList()
            
        };
    }
}