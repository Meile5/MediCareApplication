using Application.Interfaces.Infrastructure.Postgres;
using Application.Interfaces.Infrastructure.Postgres.ChatRep;
using Application.Interfaces.Infrastructure.Postgres.DoctorRep;
using Application.Interfaces.Infrastructure.Postgres.PatientRep;
using Application.Interfaces.Infrastructure.Postgres.PatientRepRep;
using Application.Interfaces.Infrastructure.Postgres.VitalsRep;
using Application.Models;
using Infrastructure.Postgres.Postgresql.Data;
using Infrastructure.Postgres.Postgresql.Data.ChatRepo;
using Infrastructure.Postgres.Postgresql.Data.DoctorRepo;
using Infrastructure.Postgres.Postgresql.Data.PatientRepo;
using Infrastructure.Postgres.Postgresql.Data.VitalsRepo;

//using Infrastructure.Postgres.Postgresql.Data;
using Infrastructure.Postgres.Scaffolding;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;

namespace Infrastructure.Postgres;

public static class Extensions
{
    public static IServiceCollection AddDataSourceAndRepositories(this IServiceCollection services)
    {
        services.AddDbContext<MyDbContext>((service, options) =>
        {
            var provider = services.BuildServiceProvider();
            options.UseNpgsql(
                provider.GetRequiredService<IOptionsMonitor<AppOptions>>().CurrentValue.DbConnectionString);
            options.EnableSensitiveDataLogging();
        });

       // services.AddScoped<IQuestionRepository, QuestionRepository>();\
       services.AddScoped<IDataRepository, Repo>();
       services.AddScoped<IPatientRep, PatientRepo>();
       services.AddScoped<IDoctorRep, DoctorRepo>();
        services.AddScoped<IAppointmentRep, AppointmentRepo>();
       services.AddScoped<IBookingRep, BookingRepo>();
       services.AddScoped<IChatRep, ChatRepo>();
       services.AddScoped<IOverviewRepo, OverviewRepo>();
       services.AddScoped<IVitalsRep, VitalsRepo>();
       services.AddScoped<IOverviewPatientsRepo, OverviewPatientsRepo>();
        services.AddScoped<Seeder>();

        return services;
    }
}