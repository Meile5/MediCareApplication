using System;
using System.Collections.Generic;

namespace Core.Domain.Entities;

public partial class Question
{
    public string Id { get; set; } = null!;

    public string Questiontext { get; set; } = null!;

    public DateTime? Timestamp { get; set; }
}
