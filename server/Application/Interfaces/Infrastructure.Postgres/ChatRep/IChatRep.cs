using Core.Domain.Entities;


namespace Application.Interfaces.Infrastructure.Postgres.ChatRep;

public interface IChatRep{
    Task CreateChatRoom(ChatRoom chatRoom);

    //Task<List<Message>> RetreiveChatHistory(string doctorId, string patientId);

}