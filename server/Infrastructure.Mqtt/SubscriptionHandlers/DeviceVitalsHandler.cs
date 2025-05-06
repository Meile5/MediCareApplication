using System.Text.Json;
using System.Threading.Tasks;
using Application.Interfaces.Infrastructure.Websocket;
using Application.Models.Dtos;

namespace Infrastructure.Mqtt.SubscriptionHandlers;

public class DeviceVitalsHandler : IMqttEventHandler
{
    private readonly IConnectionManager _connectionManager;

    public DeviceVitalsHandler(IConnectionManager connectionManager)
    {
        _connectionManager = connectionManager;
    }

    public string TopicPattern => "medicare/patient/vitals/+";

    public async Task HandleAsync(MqttEvent evt)
    {
        var topicParts = evt.Topic.Split('/');
        var deviceId = topicParts.Last();

        try
        {
            var payloadObj = JsonSerializer.Deserialize<VitalsPayload>(evt.Payload, new JsonSerializerOptions
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
                Temperature = payloadObj.Temperature,
                Ecg = payloadObj.Ecg
            };

            await _connectionManager.BroadcastToTopic(deviceId, deviceVitals);
        }
        catch
        {
            
        }
    }

    public class VitalsPayload
    {
        public double Temperature { get; set; }
        public List<int> Ecg { get; set; } = new();
        
    }
}
