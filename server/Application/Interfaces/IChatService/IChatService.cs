using Application.Models.Dtos.ChatDtos;
using Core.Domain.Entities;

namespace Application.Interfaces.IChatService;
public interface IChatService{
    Task CreateChatRoom(CreateChatRoomDto createChatRoomDto);

    Task SaveMessage(SendMessageDto messageDto);
    Task<List<ChatRoom>> GetChatRoomsForPatient(string patientId);
    Task<List<ChatRoom>> GetChatRoomsForDoctor(string doctorId);
}