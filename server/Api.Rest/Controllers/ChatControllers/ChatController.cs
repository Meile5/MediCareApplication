using Application.Interfaces.IChatService;
using Application.Models.Dtos.ChatDtos;
using Microsoft.AspNetCore.Mvc;

namespace Api.Rest.Controllers.Chat;
[ApiController]
public class ChatController(IChatService chatService) : ControllerBase{

    [Route("chat/create")]
    public async Task<ActionResult> CreateChatRoom([FromBody] CreateChatRoomDto chatRoomDto){
        await chatService.CreateChatRoom(chatRoomDto);
        return Ok();
    }

    [Route("chat/retreiveChats/patient")]
    public async Task<ActionResult> GetChatsForPatient([FromBody] UserIdChatRoomRequest chatRoomRequest){
        string patientId = chatRoomRequest.userId;
        var chatRooms = await chatService.GetChatRoomsForPatient(patientId);
        return Ok(chatRooms);
    }

    [Route("chat/retreiveChats/doctor")]
    public async Task<ActionResult> GetChatsForDoctor([FromBody] UserIdChatRoomRequest chatRoomRequest){
        string doctorId = chatRoomRequest.userId;
        var chatRooms = await chatService.GetChatRoomsForDoctor(doctorId);
        return Ok(chatRooms);
    }

}

public class UserIdChatRoomRequest
{
    public string userId { get; set; }
}
