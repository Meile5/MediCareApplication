using Core.Domain.Entities;

namespace Application.Models;

public class BroadcastToTeacher
{
    public string EventType { get; set; } = nameof(BroadcastToTeacher);
    public Question Question { get; set; }
}