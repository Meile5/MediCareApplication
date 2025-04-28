using System;
using System.Collections.Generic;

namespace Core.Domain.Entities;

public partial class Appointment
{
    public string Id { get; set; } = null!;

    public string DoctorId { get; set; } = null!;

    public string PatientId { get; set; } = null!;

    public string Status { get; set; } = null!;

    public string? Notes { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public DateTime? StartTime { get; set; }

    public DateTime? EndTime { get; set; }

    public virtual Doctor Doctor { get; set; } = null!;

    public virtual Patient Patient { get; set; } = null!;
}
