using System.Text.Json;
using Application.Interfaces;
using Application.Interfaces.Infrastructure.Websocket;
using Fleck;
using WebSocketBoilerplate;

namespace Api.Websocket.EventHandlers.Device;

public class SubscribeToVitalsEventHandler(IConnectionManager connectionManager, ISecurityService securityService) : BaseEventHandler<SubscribeToVitalsEventHandler.SubscribeToVitalsDto>
{
    public override async Task Handle(SubscribeToVitalsDto dto, IWebSocketConnection socket)
    {
        securityService.VerifyJwtOrThrow(dto.Token);
        var deviceId = dto.DeviceId;
        var clientId = connectionManager.GetClientIdFromSocket(socket);
        await connectionManager.AddToTopic(deviceId, clientId);

        
        await socket.Send(JsonSerializer.Serialize(new{
            eventType = "SubscribeSuccess",
            message = "Subscribed to device: " + deviceId
        }));
    }
    
    public class SubscribeToVitalsDto : BaseDto
    {
        public string Token { get; set; }
        public string DeviceId { get; set; }
    }
}