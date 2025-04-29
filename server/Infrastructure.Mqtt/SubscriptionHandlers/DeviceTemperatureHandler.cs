using System.Text.Json;
using System.Threading.Tasks;
using Application.Interfaces.Infrastructure.Websocket;
using Application.Models.Dtos;

namespace Infrastructure.Mqtt.SubscriptionHandlers;

public class DeviceTemperatureHandler : IMqttEventHandler
{
    private readonly IConnectionManager _connectionManager;

    public DeviceTemperatureHandler(IConnectionManager connectionManager)
    {
        _connectionManager = connectionManager;
    }

    public string TopicPattern => "medicare/patient/temperature/+";

    public async Task HandleAsync(MqttEvent evt)
    {
        var topicParts = evt.Topic.Split('/');
        var deviceId = topicParts.Last();

        try
        {
            var payloadObj = JsonSerializer.Deserialize<TemperaturePayload>(evt.Payload, new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true
            });

            if (payloadObj == null)
            {
                return;
            }

            var deviceVitals = new DeviceVitalsDto
            {
                UserId = deviceId,
                DeviceId = deviceId,
                Temperature = payloadObj.Temperature
            };

            await _connectionManager.BroadcastToTopic(deviceId, deviceVitals);
        }
        catch
        {
            
        }
    }

    public class TemperaturePayload
    {
        public double Temperature { get; set; }
    }
}
