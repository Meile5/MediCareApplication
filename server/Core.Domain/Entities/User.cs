using System;
using System.Collections.Generic;

namespace Core.Domain.Entities;

public partial class User
{
    public string Iduser { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string Hash { get; set; } = null!;

    public string Salt { get; set; } = null!;

    public string Role { get; set; } = null!;

    public virtual Doctor? Doctor { get; set; }

    public virtual ICollection<Message> Messages { get; set; } = new List<Message>();

    public virtual Patient? Patient { get; set; }

    public virtual Role RoleNavigation { get; set; } = null!;
}
