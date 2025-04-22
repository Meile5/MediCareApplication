using System;
using System.Collections.Generic;

namespace Core.Domain.Entities;

public partial class ClinicDoctor
{
    public string Idclinicdoctor { get; set; } = null!;

    public string Idclinic { get; set; } = null!;

    public string Iddoctor { get; set; } = null!;

    public virtual Clinic IdclinicNavigation { get; set; } = null!;

    public virtual Doctor IddoctorNavigation { get; set; } = null!;
}
