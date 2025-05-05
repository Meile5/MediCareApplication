using Application.Interfaces.IChatService;
using Application.Interfaces.Infrastructure.Postgres.ChatRep;
using Application.Interfaces.Infrastructure.Websocket;
using Application.Models.Dtos.ChatDtos;
using Core.Domain.Entities;

namespace Application.Services.ChatService;

public class ChatService(IChatRep chatRep, IConnectionManager connectionManager) : IChatService
{
    public async Task CreateChatRoom(CreateChatRoomDto createChatRoomDto)
    {
        var chatRoom = CreateChatRoomDto.ToEntity(createChatRoomDto);
        await chatRep.CreateChatRoom(chatRoom);
    }

    public async Task<List<ChatRoom>> GetChatRoomsForDoctor(string doctorId)
    {
        return await chatRep.GetChatRoomsForDoctor(doctorId);
        
    }

    public async Task<List<ChatRoom>> GetChatRoomsForPatient(string patientId)
    {
        return await chatRep.GetChatRoomsForPatient(patientId);
       
    }

    public async Task<List<Message>> GetMessages(string roomId)
    {
        return await chatRep.RetreiveChatHistory(roomId);
    }

    public async Task SaveMessage(SendMessageDto messageDto)
    {
        var message = SendMessageDto.ToEntity(messageDto);
        await chatRep.SaveMessageOnDb(message);
    }

    
}