using System.Text.Json;
using Application.Interfaces.Infrastructure.Websocket;
using Fleck;
using WebSocketBoilerplate;

namespace Api.Websocket.EventHandlers.Chat;

public class UnsubscribeFromChatEventHandler(IConnectionManager connectionManager)
    : BaseEventHandler<UnsubscribeFromChatEventHandler.UnsubscribeFromChatDto>
{
    public override async Task Handle(UnsubscribeFromChatDto dto, IWebSocketConnection socket)
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

    public class UnsubscribeFromChatDto : BaseDto
    {
        public string RoomId { get; set; }
    }
}
