using System.Threading.Tasks;
using Microsoft.Extensions.Logging;

namespace Infrastructure.Mqtt.SubscriptionHandlers;

public class DeviceTemperatureHandler : IMqttEventHandler
{
    private readonly ILogger<DeviceTemperatureHandler> _logger;

    public DeviceTemperatureHandler(ILogger<DeviceTemperatureHandler> logger)
    {
        _logger = logger;
    }

    public string TopicPattern => "medicare/patient/temperature/+";


    public Task HandleAsync(MqttEvent evt)
    {
        var topicParts = evt.Topic.Split('/');
        var deviceId = topicParts.Last(); 

        _logger.LogInformation("Received temperature data from Device {DeviceId}: {Payload}", deviceId, evt.Payload);
        return Task.CompletedTask;
    }
}
