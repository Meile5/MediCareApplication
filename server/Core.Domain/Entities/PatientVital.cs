using System;
using System.Collections.Generic;

namespace Core.Domain.Entities;

public partial class PatientVital
{
    public string Id { get; set; } = null!;

    public string PatientId { get; set; } = null!;

    public decimal? OxygenLevel { get; set; }

    public decimal? BodyTemperature { get; set; }

    public int? HeartRate { get; set; }

    public DateTime? CreatedAt { get; set; }

    public string? EcgSummary { get; set; }

    public virtual Patient Patient { get; set; } = null!;
}
