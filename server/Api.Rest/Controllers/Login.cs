using Application.Models.Dtos;
using Microsoft.AspNetCore.Mvc;

namespace Api.Rest.Controllers;
[ApiController]
public class Login :ControllerBase
{
    [HttpPost]
    [Route("login")]
    
    public IActionResult LoginM([FromBody] AuthRequestDto request)
    {
        // Hardcoded users
        var doctor = new { id = "doctor_123", name = "Dr. Smith", role = "doctor", roomId = "room_1" };
        var patient = new { id = "patient_456", name = "John Doe", role = "patient", roomId = "room_1" };

        if (request.Email == "doctor")
        {
            return Ok(new { token = "dummy-jwt-token", user = doctor });
        }
        else if (request.Email == "patient")
        {
            return Ok(new { token = "dummy-jwt-token", user = patient });
        }
    
        return Unauthorized("Invalid credentials");
    }

}