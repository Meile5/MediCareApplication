using Application.Interfaces.Infrastructure.Mqtt;
using Application.Models.Dtos;
using Microsoft.AspNetCore.Mvc;

namespace Api.Rest.Controllers;

[ApiController]
[Route("device")]
public class DeviceController : ControllerBase
{
    private readonly IMqttPublisher<ClientWantsToPairDeviceDto> _mqttPublisher;

    public DeviceController(IMqttPublisher<ClientWantsToPairDeviceDto> mqttPublisher)
    {
        _mqttPublisher = mqttPublisher;
    }

    [HttpPost("pair")]
    public async Task<IActionResult> PairDevice([FromBody] ClientWantsToPairDeviceDto request){
        await _mqttPublisher.Publish(request);

        return Ok(new 
        { 
            message = $"Assigned DeviceId {request.DeviceId} to pairingCode {request.PairingCode} successfully."
        });
    }
}
