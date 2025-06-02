using Application;
using Application.Interfaces;
using Application.Interfaces.IChatService;
using Application.Interfaces.Infrastructure.Websocket;
using Application.Models.Dtos.ChatDtos;
using Fleck;
using WebSocketBoilerplate;

namespace Api.Websocket.EventHandlers.Chat;


public class ChatMessageEventHandler(IConnectionManager connectionManager, IChatService chatService, ISecurityService securityService, ILogger<ChatMessageEventHandler> logger) : BaseEventHandler<ChatMessageEventHandler.ChatMessageDto>
{
    public override async Task Handle(ChatMessageDto dto, IWebSocketConnection socket){
        try
        {
            var token = dto.Token;
            securityService.VerifyJwtOrThrow(token);

            var userId = dto.UserId;
            var roomId = dto.RoomId;

            await connectionManager.AddToTopic(roomId, userId);

            var broadcastMessage = new ChatMessageDto
            {
                RoomId = roomId,
                UserId = userId,
                Name = dto.Name,
                Message = dto.Message,
                Token = "no token"
            };

            var saveMessage = new SendMessageDto
            {
                RoomId = roomId,
                SenderId = userId,
                Content = dto.Message,
                IsRead = false,
                SenderName = dto.Name
            };

            await chatService.SaveMessage(saveMessage);
            await connectionManager.BroadcastToTopic(roomId, broadcastMessage);
        }
        catch (Exception ex)
        {
            logger.LogError(ex, ErrorMessages.GetMessage(ErrorCode.ChatEventHandler));
        }
    }
    
    public class ChatMessageDto : BaseDto
    {
        public string Token { get; set; }
        public string RoomId { get; set; }
        public string UserId { get; set; }
        public string Name {get;set;}
        public string Message { get; set; }
    }


}
