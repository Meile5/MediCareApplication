using System;
using System.Collections.Generic;

namespace Core.Domain.Entities;

public partial class Patient
{
    public string Userid { get; set; } = null!;

    public string Name { get; set; } = null!;

    public string Surname { get; set; } = null!;

    public string Gender { get; set; } = null!;

    public string Age { get; set; } = null!;

    public string Bloodtype { get; set; } = null!;

    public string? Allergies { get; set; }

    public string Phonenumber { get; set; } = null!;

    public string Address { get; set; } = null!;

    public string? DeviceId { get; set; }

    public virtual ICollection<Appointment> Appointments { get; set; } = new List<Appointment>();

    public virtual ICollection<ChatRoom> ChatRooms { get; set; } = new List<ChatRoom>();

    public virtual ICollection<ClinicPatient> ClinicPatients { get; set; } = new List<ClinicPatient>();

    public virtual ICollection<Diagnosis> Diagnoses { get; set; } = new List<Diagnosis>();

    public virtual ICollection<PatientVital> PatientVitals { get; set; } = new List<PatientVital>();

    public virtual User User { get; set; } = null!;

    public virtual ICollection<Doctor> Doctors { get; set; } = new List<Doctor>();
}
