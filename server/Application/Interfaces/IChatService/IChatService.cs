using Application.Models.Dtos.ChatDtos;

namespace Application.Interfaces.IChatService;
public interface IChatService{
    Task CreateChatRoom(CreateChatRoomDto createChatRoomDto);
}