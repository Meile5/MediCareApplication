using System;
using System.Collections.Generic;

namespace Core.Domain.Entities;

public partial class DoctorAvailability
{
    public string Id { get; set; } = null!;

    public string DoctorId { get; set; } = null!;

    public DateOnly DayOfWeek { get; set; }

    public TimeOnly StartTime { get; set; }

    public TimeOnly EndTime { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual Doctor Doctor { get; set; } = null!;
}
