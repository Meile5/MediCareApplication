using Core.Domain.Entities;

namespace Application.Models.Dtos.ChatDtos;

public class CreateChatRoomDto{
    public string? DoctorId { get; set; }
    public string? PatientId { get; set; }
    public string? Topic { get; set; }

    public static ChatRoom ToEntity (CreateChatRoomDto chatRoom){
        return new ChatRoom{
            Id = Guid.NewGuid().ToString(),
            DoctorId = chatRoom.DoctorId,
            PatientId = chatRoom.PatientId,
            CreatedAt = DateTime.Now,
            Topic = chatRoom.Topic,
            IsFinished = true
        };
    }



}