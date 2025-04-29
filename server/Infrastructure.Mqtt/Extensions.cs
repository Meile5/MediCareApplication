using Application.Interfaces.Infrastructure.Mqtt;
using Application.Models;
using Application.Models.Dtos;
using Core.Domain;
using Core.Domain.Entities;
using Infrastructure.Mqtt.PublishingHandlers;

//using Infrastructure.Mqtt.PublishingHandlers;
using Infrastructure.Mqtt.SubscriptionHandlers;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using MQTTnet;
using MQTTnet.Formatter;

namespace Infrastructure.Mqtt;

public static class Extensions
{
    public static IServiceCollection RegisterMqttInfrastructure(this IServiceCollection services)
    {
        services.AddSingleton<IMqttClient>(new MqttClientFactory().CreateMqttClient());
        services.AddSingleton<MqttEventBus>();
        
      
        services.AddScoped<DeviceVitalsHandler>();
        services.AddScoped<IMqttEventHandler, DeviceVitalsHandler>();
        services.AddScoped<DevicePairingCodeHandler>();
        services.AddScoped<IMqttEventHandler, DevicePairingCodeHandler>();
        services.AddSingleton<IMqttPublisher<ClientWantsToPairDeviceDto>, PairDeviceHandler>();
        


       
        
        return services;
    }

   public static async Task<WebApplication> ConfigureMqtt(this WebApplication app, int mqttPort)
{
    var appOptions = app.Services.GetRequiredService<IOptionsMonitor<AppOptions>>().CurrentValue;
    var mqttClient = app.Services.GetRequiredService<IMqttClient>();
    var eventBus = app.Services.GetRequiredService<MqttEventBus>();

    var options = new MqttClientOptionsBuilder()
        .WithTcpServer(appOptions.MQTT_BROKER_HOST, mqttPort)
        .WithCredentials(appOptions.MQTT_USERNAME, appOptions.MQTT_PASSWORD)
        .WithClientId($"cloudrun_{Environment.GetEnvironmentVariable("K_SERVICE")}_{Guid.NewGuid()}")
        .WithTlsOptions(new MqttClientTlsOptions
        {
            UseTls = true,
            AllowUntrustedCertificates = true,
            IgnoreCertificateChainErrors = true,
            IgnoreCertificateRevocationErrors = true,
            CertificateValidationHandler = _ => true
        })
        .WithCleanSession()
        .WithKeepAlivePeriod(TimeSpan.FromSeconds(60))
        .WithTimeout(TimeSpan.FromSeconds(30))
        .WithProtocolVersion(MQTTnet.Formatter.MqttProtocolVersion.V311)
        .Build();

 
    var result = await mqttClient.ConnectAsync(options, CancellationToken.None);
    if (result.ResultCode != MqttClientConnectResultCode.Success)
    {
        throw new Exception($"MQTT connection failed: {result.ResultCode} - {result.ReasonString}");
    }

    using var scope = app.Services.CreateScope();
    var handlers = scope.ServiceProvider.GetServices<IMqttEventHandler>();

    await eventBus.RegisterHandlersAsync(handlers);

    return app;
}

}