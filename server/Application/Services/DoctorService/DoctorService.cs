using Application.Interfaces.IDoctorService;
using Application.Interfaces.Infrastructure.Postgres.DoctorRep;
using Application.Interfaces.Infrastructure.Postgres.PatientRepRep;
using Application.Interfaces.IPatientService;
using Core.Domain.Entities;
namespace Application.Services.DoctorService;

public class DoctorService(IDoctorRep doctorRep) : IDoctorService
{
    public async Task<Doctor> GetDoctorFromDb(string doctorId)
    {
        return await doctorRep.GetDoctorById(doctorId);
    }
}