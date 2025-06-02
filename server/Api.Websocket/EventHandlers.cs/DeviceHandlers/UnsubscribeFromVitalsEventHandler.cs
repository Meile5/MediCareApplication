using System.Text.Json;
using Application;
using Application.Interfaces.Infrastructure.Websocket;
using Fleck;
using WebSocketBoilerplate;

namespace Api.Websocket.EventHandlers.Device;

public class UnsubscribeFromVitalsEventHandler(IConnectionManager connectionManager, ILogger<UnsubscribeFromVitalsEventHandler> logger)
    : BaseEventHandler<UnsubscribeFromVitalsEventHandler.UnsubscribeFromVitalsDto>
{
    public override async Task Handle(UnsubscribeFromVitalsDto dto, IWebSocketConnection socket)
    {
        try
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
        catch (Exception ex)
        {
            logger.LogError(ex, ErrorMessages.GetMessage(ErrorCode.UnsubscribeVitals));
        }
    }

    public class UnsubscribeFromVitalsDto : BaseDto
    {
        public string DeviceId { get; set; }
    }
}
