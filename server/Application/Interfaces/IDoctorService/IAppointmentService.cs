using Core.Domain.Entities;

namespace Application.Interfaces.IDoctorService;

public interface IAppointmentService
{
    Task<List<Appointment>> RetrieveDoctorAppointments(string doctorId);
    Task ConfirmAppointment(string appointmentId, String roomId, DateTime startTime, DateTime endTime);
    Task RejectAppointment(string appointmentId, string doctorId);
    Task<string> GetPatientName(string appointmentId);
}