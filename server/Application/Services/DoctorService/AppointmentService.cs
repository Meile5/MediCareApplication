using Application.Interfaces.IDoctorService;
using Application.Interfaces.Infrastructure.Postgres.DoctorRep;
using Application.Interfaces.Infrastructure.Websocket;
using Application.Models.Dtos.DoctorDto.requests;
using Application.Models.Dtos.DoctorDto.response;
using Core.Domain.Entities;

namespace Application.Services.DoctorService;

public class AppointmentService(IAppointmentRep appointmentRep, IConnectionManager connectionManager) : IAppointmentService
{
    public async Task ConfirmAppointment(string appointmentId, String roomId, DateTime startTIme, DateTime endTime)
    {
        await appointmentRep.ConfirmAppointment(appointmentId);
        var broadcast = new ApprovedAppointment()
        {
            AppointmentId = appointmentId
        };
        var slot = new ConfirmedSlot()
        {
            startTime = startTIme,
            endTime = endTime
        };
        await connectionManager.BroadcastToTopic(roomId, broadcast);
        await connectionManager.BroadcastToTopic(roomId, slot); 
    }

    public async Task<string> GetPatientName(string appointmentId)
    {
        return await appointmentRep.GetPatientName(appointmentId);
    }

    public async Task RejectAppointment(string appointmentId, string doctorId)
    {
        await appointmentRep.RejectAppointment(appointmentId);
        var broadcast = new CancelledAppointment()
        {
            AppointmentId = appointmentId
        };
        await connectionManager.BroadcastToTopic(doctorId ,broadcast);
    }

    public async Task<List<Appointment>> RetrieveDoctorAppointments(string doctorId)
    {
        return await appointmentRep.RetrieveDoctorAppointments(doctorId);
    }
}