using Core.Domain.Entities;

namespace Application.Interfaces.Infrastructure.Postgres.PatientRep;

public interface IBookingRep
{
    
    Task<List<DoctorAvailability>> RetrieveDoctorAvailability(string doctorId);
    Task<List<Appointment>> RetrieveDoctorAppointments(string doctorId);
    Task<string> ManageAppointments(Appointment appointment, ChatRoom chatRoom);
    Task<List<Appointment>> RetrieveFutureAppointments(string userId);
    Task<List<Appointment>> RetrievePastAppointments(string userId);
    Task CancelAppointment(string dtoId);
    Task<List<Doctor>> RetrieveClinicDoctor(string clinicId);
}