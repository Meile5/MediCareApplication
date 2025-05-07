using Application.Interfaces.Infrastructure.Postgres;
using Core.Domain.Entities;
using Infrastructure.Postgres.Scaffolding;

namespace Infrastructure.Postgres.Postgresql.Data;

public class Repo(MyDbContext ctx) : IDataRepository
{

    
    public User? GetUserOrNull(string email)
    {
        return ctx.Users.FirstOrDefault(u => u.Email == email);
    }

    public User AddUser(User user)
    {
        ctx.Users.Add(user);
        ctx.SaveChanges();
        return user;
    }

    public void AddPatient(Patient patient)
{
    ctx.Patients.Add(patient);
    ctx.SaveChanges();
}

public void AddDoctor(Doctor doctor)
{
    ctx.Doctors.Add(doctor);
    ctx.SaveChanges();
}

}