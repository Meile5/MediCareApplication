using System;
using System.Collections.Generic;

namespace Core.Domain.Entities;

public partial class Clinic
{
    public string Idclinic { get; set; } = null!;

    public string Clinicname { get; set; } = null!;

    public string Address { get; set; } = null!;

    public string Phonenumber { get; set; } = null!;

    public string Type { get; set; } = null!;

    public virtual ICollection<ClinicDoctor> ClinicDoctors { get; set; } = new List<ClinicDoctor>();

    public virtual ICollection<ClinicPatient> ClinicPatients { get; set; } = new List<ClinicPatient>();
}
