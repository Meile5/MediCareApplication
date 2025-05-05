using System;
using System.Collections.Generic;

namespace Core.Domain.Entities;

public partial class ChatRoom
{
    public string Id { get; set; } = null!;

    public string DoctorId { get; set; } = null!;

    public string PatientId { get; set; } = null!;

    public DateTime? CreatedAt { get; set; }

    public string Topic { get; set; } = null!;

    public bool IsFinished { get; set; }

    public DateTime StartTime { get; set; }

    public DateTime? EndTime { get; set; }

    public virtual Doctor Doctor { get; set; } = null!;

    public virtual ICollection<Message> Messages { get; set; } = new List<Message>();

    public virtual Patient Patient { get; set; } = null!;
}
