using System;
using System.Collections.Generic;

namespace Core.Domain.Entities;

public partial class Message
{
    public string Id { get; set; } = null!;

    public string? RoomId { get; set; }

    public string? SenderId { get; set; }

    public string? Content { get; set; }

    public DateTime? SentAt { get; set; }

    public bool? IsRead { get; set; }

    public virtual ChatRoom? Room { get; set; }

    public virtual User? Sender { get; set; }
}
