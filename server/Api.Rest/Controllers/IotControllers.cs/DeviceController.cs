using Application.Interfaces;
using Application.Interfaces.Infrastructure.Mqtt;
using Application.Models.Dtos;
using Microsoft.AspNetCore.Mvc;

namespace Api.Rest.Controllers.Device;

[ApiController]
public class DeviceController : ControllerBase
{
    private readonly IMqttPublisher<ClientWantsToPairDeviceDto> _mqttPublisher;
    private IVitalsService _vitalsService;
    private ISecurityService _securityService;
    public DeviceController(IMqttPublisher<ClientWantsToPairDeviceDto> mqttPublisher, IVitalsService vitalsService, ISecurityService securityService)
    {
        _mqttPublisher = mqttPublisher;
        _vitalsService = vitalsService;
        _securityService = securityService;
    }




    [Route("device/saveVitals")]
    [HttpPost]
    public async Task<IActionResult> SaveVitals([FromBody] SaveVitalsDto saveVitalsDto, [FromHeader] string authorization)
    {
        _securityService.VerifyJwtOrThrow(authorization);
        await _vitalsService.SaveVitals(saveVitalsDto);
        return Ok();
    }
    [Route("device/pair")]
    [HttpPost]
    public async Task<IActionResult> PairDevice([FromBody] ClientWantsToPairDeviceDto request){
       
        await _mqttPublisher.Publish(request);
        await _vitalsService.PairDevice(request.DeviceId, request.PatientId);
        return Ok(new 
        { 
            message = $"Assigned DeviceId {request.DeviceId} to pairingCode {request.PairingCode} successfully."
        });
    }

}
