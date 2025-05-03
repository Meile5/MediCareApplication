﻿using Application.Models.Dtos.PatientDto;
using Core.Domain.Entities;

namespace Application.Interfaces.Infrastructure.Postgres.PatientRep;

public interface IBookingRep
{
    
    Task<List<DoctorAvailability>> RetrieveDoctorAvailability(string doctorId);
    Task<List<Appointment>> RetrieveDoctorAppointments(string doctorId);
    Task <string>BookAppointment(Appointment appointments);
    Task UpdateChatRoomStartTime(DateTime appointmentsStartTime, string doctorId, string roomId);
}