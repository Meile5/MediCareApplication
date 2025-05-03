using System;
using System.Collections.Generic;

namespace Core.Domain.Entities;

public partial class ChatRoom
{
    public string Id { get; set; } = null!;

    public string? DoctorId { get; set; }

    public string? PatientId { get; set; }

    public DateTime? CreatedAt { get; set; }

    public string? Topic { get; set; }

    public bool? IsFinished { get; set; }

    public virtual Doctor? Doctor { get; set; }

    public virtual ICollection<Message> Messages { get; set; } = new List<Message>();

    public virtual Patient? Patient { get; set; }
}
