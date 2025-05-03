using Application.Interfaces.IChatService;
using Application.Interfaces.Infrastructure.Postgres.ChatRep;
using Application.Interfaces.Infrastructure.Websocket;
using Application.Models.Dtos.ChatDtos;

namespace Application.Services.ChatService;

public class ChatService(IChatRep chatRep, IConnectionManager connectionManager) : IChatService
{
    public async Task CreateChatRoom(CreateChatRoomDto createChatRoomDto)
    {
        var chatRoom = CreateChatRoomDto.ToEntity(createChatRoomDto);
        await chatRep.CreateChatRoom(chatRoom);
    }
}