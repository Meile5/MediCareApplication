using Core.Domain.Entities;
namespace Application.Interfaces.Infrastructure.Postgres.DoctorRep;

public interface IAppointmentRep
{
    Task<List<Appointment>> RetrieveDoctorAppointments(string doctorId);
    Task ConfirmAppointment(string appointmentId);
    Task RejectAppointment(string appointmentId);
}