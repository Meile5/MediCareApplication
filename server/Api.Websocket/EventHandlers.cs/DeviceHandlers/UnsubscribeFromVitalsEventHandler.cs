using System.Text.Json;
using Application.Interfaces.Infrastructure.Websocket;
using Fleck;
using WebSocketBoilerplate;

namespace Api.Websocket.EventHandlers.Device;

public class UnsubscribeFromVitalsEventHandler(IConnectionManager connectionManager)
    : BaseEventHandler<UnsubscribeFromVitalsEventHandler.UnsubscribeFromVitalsDto>
{
    public override async Task Handle(UnsubscribeFromVitalsDto dto, IWebSocketConnection socket)
    {
        var deviceId = dto.DeviceId;
        var clientId = connectionManager.GetClientIdFromSocket(socket);

        await connectionManager.RemoveFromTopic(deviceId, clientId);

        await socket.Send(JsonSerializer.Serialize(new
        {
            eventType = "UnsubscribeSuccess",
            message = "Unsubscribed from device: " + deviceId
        }));
    }

    public class UnsubscribeFromVitalsDto : BaseDto
    {
        public string DeviceId { get; set; }
    }
}
