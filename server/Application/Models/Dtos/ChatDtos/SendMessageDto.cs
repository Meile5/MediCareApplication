using Core.Domain.Entities;

namespace Application.Models.Dtos.ChatDtos;

public class SendMessageDto{
    public required string RoomId { get; set; }
    public required string SenderId { get; set; }
    public required string Content { get; set; }
    public required string SenderName {get;set;}
    public bool IsRead { get; set; }

    public static Message ToEntity (SendMessageDto messageDto){
        return new Message{
            Id = Guid.NewGuid().ToString(),
            RoomId = messageDto.RoomId,
            SenderId = messageDto.SenderId,
            Content = messageDto.Content,
            SentAt = DateTime.Now,
            IsRead = messageDto.IsRead,
            SenderName = messageDto.SenderName
        };
    }
}