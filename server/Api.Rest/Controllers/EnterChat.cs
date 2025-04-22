using Application.Interfaces.Infrastructure.Websocket;
using Microsoft.AspNetCore.Mvc;
using WebSocketBoilerplate;

namespace Api.Rest.Controllers;

[ApiController]
[Route("chat")]
public class ChatController : ControllerBase
{
    private readonly IConnectionManager _connectionManager;

    public ChatController(IConnectionManager connectionManager)
    {
        _connectionManager = connectionManager;
    }

    [HttpPost("enter-chat")]
    public async Task<IActionResult> EnterChat([FromBody] EnterChatRequest request)
    {
        string roomId = "room_1";  // Hardcoded for now

        var clientId = request.UserId; // REST cannot retrieve WebSocket connection directly

        // Notify WebSocket clients about new joiner
        var joinNotification = new ServerMessageDto
        {
            Message = $"{clientId} has joined the chat.",
            RoomId = roomId
        };

        await _connectionManager.BroadcastToTopic(roomId, joinNotification);

        return Ok(new { message = $"{request.UserId} joined {roomId}" });
    }
}

// Request model
public class EnterChatRequest
{
    public string UserId { get; set; }
}

public class ServerMessageDto : BaseDto
{
    public string Message { get; set; }
    public string RoomId { get; set; }
}
