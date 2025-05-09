using System;
using System.Collections.Generic;

namespace Core.Domain.Entities;

public partial class Doctor
{
    public string Doctorid { get; set; } = null!;

    public string Name { get; set; } = null!;

    public string Surname { get; set; } = null!;

    public string? Age { get; set; }

    public string? Gender { get; set; }

    public string Specialty { get; set; } = null!;

    public virtual ICollection<Appointment> Appointments { get; set; } = new List<Appointment>();

    public virtual ICollection<ChatRoom> ChatRooms { get; set; } = new List<ChatRoom>();

    public virtual ICollection<ClinicDoctor> ClinicDoctors { get; set; } = new List<ClinicDoctor>();

    public virtual ICollection<Diagnosis> Diagnoses { get; set; } = new List<Diagnosis>();

    public virtual ICollection<DoctorAvailability> DoctorAvailabilities { get; set; } = new List<DoctorAvailability>();

    public virtual User DoctorNavigation { get; set; } = null!;

    public virtual ICollection<DoctorPatient> DoctorPatients { get; set; } = new List<DoctorPatient>();
}
