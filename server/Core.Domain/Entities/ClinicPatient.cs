using System;
using System.Collections.Generic;

namespace Core.Domain.Entities;

public partial class ClinicPatient
{
    public string Idclinicpatient { get; set; } = null!;

    public string Idclinic { get; set; } = null!;

    public string Idpatient { get; set; } = null!;

    public virtual Clinic IdclinicNavigation { get; set; } = null!;

    public virtual Patient IdpatientNavigation { get; set; } = null!;
}
