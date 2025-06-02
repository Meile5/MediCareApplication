using Application;
using Application.Interfaces;
using Application.Interfaces.Infrastructure.Websocket;
using Fleck;
using WebSocketBoilerplate;

namespace Api.Websocket;

public class JoinRoomEventHandler(IConnectionManager connectionManager, ISecurityService securityService, ILogger<JoinRoomEventHandler> logger) : BaseEventHandler<JoinRoomDto>
{
    public override async Task Handle(JoinRoomDto dto, IWebSocketConnection socket)
    {
        try
        {
            securityService.VerifyJwtOrThrow(dto.Token);
            var clientId = connectionManager.GetClientIdFromSocket(socket);
            var roomId = dto.RoomId;

            await connectionManager.AddToTopic(roomId, clientId);

            var joinNotification = new ServerMessageDto
            {
                Message = $"{clientId} has joined the chat.",
                RoomId = roomId
            };

            await connectionManager.BroadcastToTopic(roomId, joinNotification);
        }
        catch (Exception ex)
        {
            logger.LogError(ex, ErrorMessages.GetMessage(ErrorCode.JoinRoom));
            
        }
    }
}

public class JoinRoomDto : BaseDto
{
    public string Token { get; set; }
    public string RoomId { get; set; }

}

public class ServerMessageDto : BaseDto
{
    public string Message { get; set; }
    public string RoomId { get; set; }
}