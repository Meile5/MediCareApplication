using Core.Domain.Entities;

namespace Application.Interfaces.Infrastructure.Postgres.DoctorRep;

public interface IDoctorRep{
    Task<Doctor> GetDoctorById(string doctorId);
}