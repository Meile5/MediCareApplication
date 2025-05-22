
using Core.Domain.Entities;

namespace Application.Interfaces.IDoctorService;

public interface IDoctorService{
    Task<Doctor> GetDoctorFromDb(string doctorId);

}