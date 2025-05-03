/*
using Application.Interfaces.Infrastructure.Websocket;
using Fleck;
using WebSocketBoilerplate;

namespace Api.Websocket;


public class ChatMessageEventHandler(IConnectionManager connectionManager) : BaseEventHandler<ChatMessageEventHandler.ChatMessageDto>
{
    public override async Task Handle(ChatMessageDto dto, IWebSocketConnection socket)
    {
        // You can optionally validate the user or enrich the DTO here
        var userId = dto.UserId; // Assuming the dto contains the user ID
        var roomId = dto.RoomId;
        
        await connectionManager.AddToTopic(roomId, userId);

        // Create a server message to broadcast (could be the same as the dto or a modified version)
        var broadcastMessage = new ChatMessageDto
        {
            RoomId = roomId,
            UserId = userId,
            Message = dto.Message
        };

        // Broadcast the message to everyone in the room
        await connectionManager.BroadcastToTopic(roomId, broadcastMessage);
    }
    
    public class ChatMessageDto : BaseDto
    {
        public string RoomId { get; set; }
        public string UserId { get; set; }
        public string Message { get; set; }
    }

}
*/