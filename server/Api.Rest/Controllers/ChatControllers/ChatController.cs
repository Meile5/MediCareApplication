using Application.Interfaces.IChatService;
using Application.Models.Dtos.ChatDtos;
using Microsoft.AspNetCore.Mvc;

namespace Api.Rest.Controllers.Chat;
[ApiController]
[Route("chat/create")]
public class ChatController(IChatService chatService) : ControllerBase{
    public async Task<ActionResult> CreateChatRoom([FromBody] CreateChatRoomDto chatRoomDto){
        await chatService.CreateChatRoom(chatRoomDto);
        return Ok();
    }

}
