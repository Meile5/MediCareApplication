using Microsoft.Extensions.Logging;
using System.Collections.Concurrent;
using System.Text.Json;

namespace Infrastructure.Mqtt.SubscriptionHandlers;

public class DevicePairingCodeHandler : IMqttEventHandler
{
    private readonly ILogger<DevicePairingCodeHandler> _logger;
    private static readonly ConcurrentDictionary<string, string> _pairingCodes = new(); 

    public DevicePairingCodeHandler(ILogger<DevicePairingCodeHandler> logger){
        _logger = logger;
    }

    public string TopicPattern => "medicare/device/pairing-code"; 

    public Task HandleAsync(MqttEvent evt){
    var pairingInfo = JsonSerializer.Deserialize<DevicePairingInfo>(evt.Payload);

    if (pairingInfo != null)
    {
        _logger.LogInformation("Received new device pairing code: {Code} for device {DeviceId}", pairingInfo.pairingCode, pairingInfo.deviceId);
        _pairingCodes[pairingInfo.pairingCode] = pairingInfo.deviceId;
    }

    return Task.CompletedTask;
}

    
    private class DevicePairingInfo{
        public string deviceId { get; set; }
        public string pairingCode { get; set; }
    }


        public static bool TryClaimPairingCode(string code, out string deviceId){
            return _pairingCodes.TryRemove(code, out deviceId);
        }

}
