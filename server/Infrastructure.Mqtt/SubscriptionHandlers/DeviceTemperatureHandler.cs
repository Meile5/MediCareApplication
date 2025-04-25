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

    public string TopicPattern => "medicare/patient/temperature"; 

    public Task HandleAsync(MqttEvent evt)
    {
        _logger.LogInformation("Received temperature data: {Payload}", evt.Payload);
        return Task.CompletedTask;
    }
}
