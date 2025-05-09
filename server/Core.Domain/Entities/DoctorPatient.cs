using System;
using System.Collections.Generic;

namespace Core.Domain.Entities;

public partial class DoctorPatient
{
    public string DoctorId { get; set; } = null!;

    public string PatientId { get; set; } = null!;

    public string Id { get; set; } = null!;

    public virtual Doctor Doctor { get; set; } = null!;

    public virtual Patient Patient { get; set; } = null!;
}
