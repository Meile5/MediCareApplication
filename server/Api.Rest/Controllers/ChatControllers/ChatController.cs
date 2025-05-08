using Application.Interfaces;
using Application.Interfaces.IChatService;
using Application.Models.Dtos.ChatDtos;
using Microsoft.AspNetCore.Mvc;

namespace Api.Rest.Controllers.Chat;
[ApiController]
public class ChatController(IChatService chatService, ISecurityService securityService) : ControllerBase{

    [Route("chat/create")]
    [HttpPost]
    public async Task<ActionResult> CreateChatRoom([FromBody] CreateChatRoomDto chatRoomDto, [FromHeader]string authorization){
        await chatService.CreateChatRoom(chatRoomDto);
        securityService.VerifyJwtOrThrow(authorization);
        return Ok();
    }

    [Route("chat/retreiveChats/patient")]
    [HttpPost]
    public async Task<ActionResult> GetChatsForPatient([FromBody] UserIdChatRoomRequest chatRoomRequest, [FromHeader]string authorization)
    {

        string patientId = chatRoomRequest.userId;
        var chatRooms = await chatService.GetChatRoomsForPatient(patientId);
        securityService.VerifyJwtOrThrow(authorization);
        return Ok(chatRooms);
    }

    [Route("chat/retreiveChats/doctor")]
    public async Task<ActionResult> GetChatsForDoctor([FromBody] UserIdChatRoomRequest chatRoomRequest, [FromHeader]string authorization){
        string doctorId = chatRoomRequest.userId;
        var chatRooms = await chatService.GetChatRoomsForDoctor(doctorId);
        securityService.VerifyJwtOrThrow(authorization);
        return Ok(chatRooms);
    }

    [Route("chat/retreiveMessages")]
    [HttpPost]
    public async Task<ActionResult> GetChatMessages([FromBody] RoomIdRequest roomIdRequest, [FromHeader]string authorization){
        string roomId = roomIdRequest.roomId;
        var messages = await chatService.GetMessages(roomId);
        securityService.VerifyJwtOrThrow(authorization);
        return Ok(messages);
    }

}

public class UserIdChatRoomRequest
{
    public string userId { get; set; }
}

public class RoomIdRequest{
    public string roomId {get;set;}
}
