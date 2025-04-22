using System;
using System.Collections.Generic;

namespace Core.Domain.Entities;

public partial class Role
{
    public string Idroles { get; set; } = null!;

    public string Namerole { get; set; } = null!;

    public virtual ICollection<User> Users { get; set; } = new List<User>();
}
