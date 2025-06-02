using System.Text.Json;
using Application;
using Application.Interfaces.Infrastructure.Websocket;
using Fleck;
using WebSocketBoilerplate;

namespace Api.Websocket.EventHandlers.Chat;

public class UnsubscribeFromChatEventHandler(IConnectionManager connectionManager, ILogger<UnsubscribeFromChatEventHandler> logger)
    : BaseEventHandler<UnsubscribeFromChatEventHandler.UnsubscribeFromChatDto>
{
    public override async Task Handle(UnsubscribeFromChatDto dto, IWebSocketConnection socket)
    {
        try
        {

            var roomId = dto.RoomId;
            var clientId = connectionManager.GetClientIdFromSocket(socket);

            await connectionManager.RemoveFromTopic(roomId, clientId);

            await socket.Send(JsonSerializer.Serialize(new
            {
                eventType = "UnsubscribeSuccess",
                message = "Unsubscribed from Room: " + roomId
            }));
        }
        catch (Exception ex)
        {
            logger.LogError(ex, ErrorMessages.GetMessage(ErrorCode.UnsubscribeRoom));
        }
    }

    public class UnsubscribeFromChatDto : BaseDto
    {
        public string RoomId { get; set; }
    }
}
