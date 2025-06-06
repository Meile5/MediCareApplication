using Api.Rest;
using Api.Websocket;
using Application;
using Application.Models;
using Infrastructure.Postgres;
using Infrastructure.Websocket;
using Infrastructure.Mqtt;
using Microsoft.Extensions.Options;
using NSwag.Generation;
using Startup.Documentation;
using Startup.Proxy;
using Microsoft.AspNetCore.Builder;
using Scalar.AspNetCore;
using Serilog;


namespace Startup;

public class Program
{
    public static async Task Main()
    {
        Log.Logger = new LoggerConfiguration()
        .WriteTo.Console()
        .WriteTo.File(
            "logs/log-.txt",
            rollingInterval: RollingInterval.Day,
            restrictedToMinimumLevel: Serilog.Events.LogEventLevel.Error 
        )
        .CreateLogger();


        try
        {
            Log.Information("Starting application");

            var builder = WebApplication.CreateBuilder();

            
            builder.Host.UseSerilog();

            ConfigureServices(builder.Services, builder.Configuration);

            var app = builder.Build();

            await ConfigureMiddleware(app);

            await app.RunAsync();
        }
        catch (Exception ex)
        {
            Log.Fatal(ex, "Application startup failed");
        }
        finally
        {
            Log.CloseAndFlush();
        }
    

    }

    public static void ConfigureServices(IServiceCollection services, IConfiguration configuration)
    {
        var appOptions = services.AddAppOptions(configuration);

        services.RegisterApplicationServices();

        services.AddDataSourceAndRepositories();
        services.AddWebsocketInfrastructure();
        services.RegisterMqttInfrastructure();
        

        

        services.RegisterWebsocketApiServices();
        services.RegisterRestApiServices();
        services.AddOpenApiDocument(conf =>
        {
            conf.DocumentProcessors.Add(new AddAllDerivedTypesProcessor());
            conf.DocumentProcessors.Add(new AddStringConstantsProcessor());
        });
        services.AddSingleton<IProxyConfig, ProxyConfig>();
    }

    public static async Task ConfigureMiddleware(WebApplication app)
    {
        var appOptions = app.Services.GetRequiredService<IOptionsMonitor<AppOptions>>().CurrentValue;

        using (var scope = app.Services.CreateScope())
        {
            if (appOptions.Seed)
                await scope.ServiceProvider.GetRequiredService<Seeder>().Seed();
        }


        app.Urls.Clear();
        app.Urls.Add($"http://0.0.0.0:{appOptions.REST_PORT}");
        
        var publicPort = int.TryParse(Environment.GetEnvironmentVariable("PORT"), out var envPort) ? envPort : appOptions.PORT;
        app.Services.GetRequiredService<IProxyConfig>()
            .StartProxyServer(publicPort, appOptions.REST_PORT, appOptions.WS_PORT);

        app.ConfigureRestApi();
        await app.ConfigureWebsocketApi(appOptions.WS_PORT);
        await app.ConfigureMqtt(appOptions.MQTT_PORT);


        app.MapGet("Acceptance", () => "Accepted");


        app.UseOpenApi(conf => { conf.Path = "openapi/v1.json"; });
        app.UseSwaggerUi(conf => {
            conf.Path = "/swagger"; 
            conf.DocumentPath = "/openapi/v1.json";
        });



        var document = await app.Services.GetRequiredService<IOpenApiDocumentGenerator>().GenerateAsync("v1");
        var json = document.ToJson();
        await File.WriteAllTextAsync("openapi.json", json);

        app.UseOpenApi(conf => { conf.Path = "openapi/v1.json"; });
        app.UseSwaggerUi(conf => {
            conf.Path = "/swagger";
            conf.DocumentPath = "/openapi/v1.json";
        });
        app.MapScalarApiReference();
    }
}