using System.Text.Json;
using Application.Interfaces.Infrastructure.Mqtt;
using Application.Models.Dtos;
using MQTTnet;

namespace Infrastructure.Mqtt.PublishingHandlers;

public class PairDeviceHandler : IMqttPublisher<ClientWantsToPairDeviceDto>
{
    private readonly IMqttClient _mqttClient;

    public PairDeviceHandler(IMqttClient mqttClient)
    {
        _mqttClient = mqttClient;
    }

    public async Task Publish(ClientWantsToPairDeviceDto dto)
    {
        var serialized = JsonSerializer.Serialize(dto, new JsonSerializerOptions
        {
            PropertyNamingPolicy = JsonNamingPolicy.CamelCase
        });

        var topic = $"medicare/pairing/{dto.PairingCode}/assign";

        var message = new MqttApplicationMessageBuilder()
            .WithTopic(topic)
            .WithPayload(serialized)
            .Build();

        await _mqttClient.PublishAsync(message);
    }
}


