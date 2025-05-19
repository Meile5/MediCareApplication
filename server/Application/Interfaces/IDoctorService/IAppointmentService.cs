using Core.Domain.Entities;

namespace Application.Interfaces.IDoctorService;

public interface IAppointmentService
{
    Task<List<Appointment>> RetrieveDoctorAppointments(string doctorId);
    Task ConfirmAppointment(string appointmentId);
    Task RejectAppointment(string appointmentId);
    Task<string> GetPatientName(string appointmentId);
}