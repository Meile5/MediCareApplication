using Application.Interfaces;
using Application.Interfaces.IChatService;
using Application.Interfaces.Infrastructure.Postgres;
using Application.Interfaces.IPatientService;
using Application.Services;
using Application.Services.ChatService;
using Application.Services.PatientService;
using Microsoft.Extensions.DependencyInjection;

namespace Application;

public static class Extensions
{
    public static IServiceCollection RegisterApplicationServices(this IServiceCollection services)
    {
       // services.AddScoped<ISecurityService, SecurityService>();
        services.AddScoped<IServiceLogic, ServiceLogic>();
        services.AddScoped<IBookingService, BookingService>();
        services.AddScoped<IChatService, ChatService>();
       
        services.AddScoped<IOverviewService, OverviewService>();
        
        return services;
    }
}