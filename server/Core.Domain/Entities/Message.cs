using System;
using System.Collections.Generic;

namespace Core.Domain.Entities;

public partial class Message
{
    public string Id { get; set; } = null!;

    public string RoomId { get; set; } = null!;

    public string SenderId { get; set; } = null!;

    public string Content { get; set; } = null!;

    public DateTime? SentAt { get; set; }

    public bool? IsRead { get; set; }

    public string SenderName { get; set; } = null!;

    public virtual ChatRoom Room { get; set; } = null!;

    public virtual User Sender { get; set; } = null!;
}
