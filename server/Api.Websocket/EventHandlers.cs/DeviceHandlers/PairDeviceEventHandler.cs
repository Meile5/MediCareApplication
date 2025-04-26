/*

using Application.Interfaces.Infrastructure.Mqtt;
using Application.Interfaces.Infrastructure.Websocket;
using Fleck;
using WebSocketBoilerplate;

namespace Api.Websocket;

public class PairDeviceEventHandler(IConnectionManager connectionManager, IMqttPublisher<ClientWantsToPairDeviceDto> mqttPublisher) 
    : BaseEventHandler<ClientWantsToPairDeviceDto>
{
    public override async Task Handle(ClientWantsToPairDeviceDto dto, IWebSocketConnection socket)
    {
        var clientId = connectionManager.GetClientIdFromSocket(socket);
        Console.WriteLine($"Client {clientId} wants to pair with device {dto.DeviceId}");

        // 1. Publish a pairing request to the device over MQTT
        await mqttPublisher.Publish(dto);

        // 2. (Optional) Save pending pair state (we can implement that later if needed)

        // 3. Respond back to the client (user) that pairing request is sent
        var confirmation = new ServerSendsPairingResponseDto
        {
            Message = $"Pairing request sent to device {dto.DeviceId}. Waiting for confirmation..."
        };

        await connectionManager.BroadcastToTopic(clientId, confirmation); 
    }
}

public class ClientWantsToPairDeviceDto : BaseDto {
    public string DeviceId {get;set;}
}

public class ServerSendsPairingResponseDto : BaseDto
{
    public string Message { get; set; }
}
*/