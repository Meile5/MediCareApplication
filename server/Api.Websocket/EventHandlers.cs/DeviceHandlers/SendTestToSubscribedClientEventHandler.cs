using System.Text.Json;
using Application.Interfaces.Infrastructure.Websocket;
using Fleck;
using WebSocketBoilerplate;

namespace Api.Websocket;

public class SendTestToSubscribedClientEventHandler(IConnectionManager connectionManager) 
    : BaseEventHandler<SendTestToSubscribedClientEventHandler.SendTestToSubscribedClientDto>
{
    public override async Task Handle(SendTestToSubscribedClientDto dto, IWebSocketConnection socket)
    {
        var deviceId = dto.DeviceId;
        
        var testMessage = new
        {
            EventType = "TestMessage",
            DeviceId = deviceId,
            Message = "This is a test message for subscribed clients",
            Timestamp = DateTime.UtcNow
        };

        await connectionManager.BroadcastToTopic(deviceId, testMessage);

        await socket.Send(JsonSerializer.Serialize(new
        {
            EventType = "TestMessageSent",
            Message = $"Test message sent to all subscribers of device: {deviceId}"
        }));
    }
    
    public class SendTestToSubscribedClientDto : BaseDto
    {
        public string DeviceId { get; set; }
    }
}