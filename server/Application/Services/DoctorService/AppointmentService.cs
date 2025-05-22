using Application.Interfaces.IDoctorService;
using Application.Interfaces.Infrastructure.Postgres.DoctorRep;
using Core.Domain.Entities;

namespace Application.Services.DoctorService;

public class AppointmentService(IAppointmentRep appointmentRep) : IAppointmentService
{
    public async Task ConfirmAppointment(string appointmentId)
    {
        await appointmentRep.ConfirmAppointment(appointmentId);
    }

    public async Task<string> GetPatientName(string appointmentId)
    {
        return await appointmentRep.GetPatientName(appointmentId);
    }

    public async Task RejectAppointment(string appointmentId)
    {
        await appointmentRep.RejectAppointment(appointmentId);
    }

    public async Task<List<Appointment>> RetrieveDoctorAppointments(string doctorId)
    {
        return await appointmentRep.RetrieveDoctorAppointments(doctorId);
    }
}