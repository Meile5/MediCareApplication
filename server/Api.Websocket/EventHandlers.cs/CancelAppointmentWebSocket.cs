using WebSocketBoilerplate;

namespace Api.Websocket.EventHandlers.cs;

public class CancelAppointmentWebSocket : BaseDto
{
    public string AppointmentId { get; set; } = null!;
}