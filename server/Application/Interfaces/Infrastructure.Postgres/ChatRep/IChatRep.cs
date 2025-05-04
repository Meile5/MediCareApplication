using Core.Domain.Entities;


namespace Application.Interfaces.Infrastructure.Postgres.ChatRep;

public interface IChatRep{
    Task CreateChatRoom(ChatRoom chatRoom);
    Task SaveMessageOnDb(Message message);
    Task<List<ChatRoom>> GetChatRoomsForPatient(string patientId);
    Task<List<ChatRoom>> GetChatRoomsForDoctor(string doctorId);
    Task<List<Message>> RetreiveChatHistory(string roomId);

}