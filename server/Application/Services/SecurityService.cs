using System.ComponentModel.DataAnnotations;
using System.Security.Authentication;
using System.Security.Cryptography;
using System.Text;
using Application.Interfaces;
using Application.Interfaces.Infrastructure.Postgres;
using Application.Models;
using Application.Models.Dtos;
using Application.Models.Enums;
using Core.Domain.Entities;
using JWT;
using JWT.Algorithms;
using JWT.Builder;
using JWT.Serializers;
using Microsoft.Extensions.Options;

namespace Application.Services;

public class SecurityService(IOptionsMonitor<AppOptions> optionsMonitor, IDataRepository repository) : ISecurityService
{
    public AuthResponseDto Login(AuthRequestDto dto)
    {
        var user = repository.GetUserOrNull(dto.Email) ?? throw new ValidationException("Username not found");
        VerifyPasswordOrThrow(dto.Password + user.Salt, user.Hash);
        return new AuthResponseDto
        {
            Jwt = GenerateJwt(new JwtClaims
            {
                Id = user.Iduser,
                Role = user.Role,
                Exp = DateTimeOffset.UtcNow.AddHours(1000)
                    .ToUnixTimeSeconds()
                    .ToString(),
                Email = dto.Email
            })
        };
    }

    public AuthResponseDto RegisterPatient(PatientRegisterRequestDto dto)
{
    var salt = GenerateSalt(); 
    var user = new User
    {
        Iduser = Guid.NewGuid().ToString(),
        Email = dto.Email,
        Role = "role-patient",
        Salt = salt,
        Hash = HashPassword(dto.Password + salt) 
    };

    repository.AddUser(user);

    repository.AddPatient(new Patient
    {
        Userid = user.Iduser,
        Name = dto.Name,
        Surname = dto.Surname,
        Gender = dto.Gender,
        Age = dto.Age,
        Bloodtype = dto.Bloodtype,
        Allergies = dto.Allergies,
        Phonenumber = dto.Phonenumber,
        Address = dto.Address,
        DeviceId = dto.DeviceId
    });

    return GenerateAuthResponse(user);
}


    public AuthResponseDto RegisterDoctor(DoctorRegisterRequestDto dto)
    {
    var salt = GenerateSalt(); 
        var user = new User
        {
            Iduser = Guid.NewGuid().ToString(),
            Email = dto.Email,
            Role = "role-doctor",
            Salt = salt,
            Hash = HashPassword(dto.Password + salt) 

        };

        repository.AddUser(user);

        repository.AddDoctor(new Doctor
        {
            Doctorid = user.Iduser,
            Name = dto.Name,
            Surname = dto.Surname,
            Age = dto.Age,
            Gender = dto.Gender,
            Specialty = dto.Specialty
        });

        return GenerateAuthResponse(user);
    }





    /// <summary>
    ///     Gives hex representation of SHA512 hash
    /// </summary>
    /// <param name="password"></param>
    /// <returns></returns>
    public string HashPassword(string password)
    {
        using var sha512 = SHA512.Create();
        var bytes = Encoding.UTF8.GetBytes(password);
        var hash = sha512.ComputeHash(bytes);
        return BitConverter.ToString(hash).Replace("-", "").ToLowerInvariant();
    }

    public void VerifyPasswordOrThrow(string password, string hashedPassword)
    {
        if (HashPassword(password) != hashedPassword)
            throw new AuthenticationException("Invalid login");
    }

    public string GenerateSalt()
    {
        return Guid.NewGuid().ToString();
    }

    public string GenerateJwt(JwtClaims claims)
    {
        var tokenBuilder = new JwtBuilder()
            .WithAlgorithm(new HMACSHA512Algorithm())
            .WithSecret(optionsMonitor.CurrentValue.JwtSecret)
            .WithUrlEncoder(new JwtBase64UrlEncoder())
            .WithJsonSerializer(new JsonNetSerializer());

        foreach (var claim in claims.GetType().GetProperties())
            tokenBuilder.AddClaim(claim.Name, claim.GetValue(claims)!.ToString());
        return tokenBuilder.Encode();
    }

    public JwtClaims VerifyJwtOrThrow(string jwt)
    {
        var token = new JwtBuilder()
            .WithAlgorithm(new HMACSHA512Algorithm())
            .WithSecret(optionsMonitor.CurrentValue.JwtSecret)
            .WithUrlEncoder(new JwtBase64UrlEncoder())
            .WithJsonSerializer(new JsonNetSerializer())
            .MustVerifySignature()
            .Decode<JwtClaims>(jwt);

        if (DateTimeOffset.FromUnixTimeSeconds(long.Parse(token.Exp)) < DateTimeOffset.UtcNow)
            throw new AuthenticationException("Token expired");
        return token;
    }

    private AuthResponseDto GenerateAuthResponse(User user) =>
    new()
    {
        Jwt = GenerateJwt(new JwtClaims
        {
            Id = user.Iduser,
            Role = user.Role,
            Exp = DateTimeOffset.UtcNow.AddHours(1000).ToUnixTimeSeconds().ToString(),
            Email = user.Email
        })
    };

}