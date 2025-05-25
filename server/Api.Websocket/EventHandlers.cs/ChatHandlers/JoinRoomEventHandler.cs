using Application.Interfaces;
using Application.Interfaces.Infrastructure.Websocket;
using Fleck;
using WebSocketBoilerplate;

namespace Api.Websocket;

// Event handler for joining a room
public class JoinRoomEventHandler(IConnectionManager connectionManager, ISecurityService securityService) : BaseEventHandler<JoinRoomDto>
{
    public override async Task Handle(JoinRoomDto dto, IWebSocketConnection socket)
    {
        securityService.VerifyJwtOrThrow(dto.Token);
        Console.WriteLine( "ggggggggggggggggggggggg" );
        var clientId = connectionManager.GetClientIdFromSocket(socket);
        var roomId = dto.RoomId; // Use hardcoded value for now

       // ctx.Messages.Add();
        // Add user to the room
        await connectionManager.AddToTopic(roomId, clientId);

        // Notify others in the room
        var joinNotification = new ServerMessageDto
        {
            Message = $"{clientId} has joined the chat.",
            RoomId = roomId
        };

        await connectionManager.BroadcastToTopic(roomId, joinNotification);
    }
}

// DTO for joining a room
public class JoinRoomDto : BaseDto
{
    public string Token { get; set; }
    public string RoomId { get; set; }

}

// DTO for server messages
public class ServerMessageDto : BaseDto
{
    public string Message { get; set; }
    public string RoomId { get; set; }
}