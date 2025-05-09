using Core.Domain.Entities;

namespace Application.Models.Dtos.ChatDtos;

public class CreateChatRoomDto{
    public string DoctorId { get; set; } = null!;
    public string PatientId { get; set; } = null!;
    public string Topic { get; set; } = null!;
    public DateTime StartTime { get; set; }
    public DateTime EndTime { get; set; }
    public bool IsFinished { get; set; } 

    


    public static ChatRoom ToEntity (CreateChatRoomDto chatRoom){
        return new ChatRoom{
            Id = Guid.NewGuid().ToString(),
            DoctorId = chatRoom.DoctorId,
            PatientId = chatRoom.PatientId,
            CreatedAt = DateTime.Now,
            Topic = chatRoom.Topic,
            StartTime = chatRoom.StartTime,
            EndTime = chatRoom.EndTime,
            IsFinished = chatRoom.IsFinished
        };
    }



}