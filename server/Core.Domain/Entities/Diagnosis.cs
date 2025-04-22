using System;
using System.Collections.Generic;

namespace Core.Domain.Entities;

public partial class Diagnosis
{
    public string Iddiagnoses { get; set; } = null!;

    public string? Diagnoses { get; set; }

    public string Idpatient { get; set; } = null!;

    public string? Treatment { get; set; }

    public string Iddoctor { get; set; } = null!;

    public DateOnly? Date { get; set; }

    public virtual Doctor IddoctorNavigation { get; set; } = null!;

    public virtual Patient IdpatientNavigation { get; set; } = null!;
}
