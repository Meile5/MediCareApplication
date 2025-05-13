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
    [HttpGet]
    public async Task<ActionResult> GetChatsForPatient([FromQuery] UserIdChatRoomRequest chatRoomRequest, [FromHeader]string authorization)
    {

        string patientId = chatRoomRequest.userId;
        var chatRooms = await chatService.GetChatRoomsForPatient(patientId);
        securityService.VerifyJwtOrThrow(authorization);
        return Ok(chatRooms);
    }

    [Route("chat/retreiveChats/doctor")]
    [HttpGet]
    public async Task<ActionResult> GetChatsForDoctor([FromQuery] UserIdChatRoomRequest chatRoomRequest, [FromHeader]string authorization){
        string doctorId = chatRoomRequest.userId;
        var chatRooms = await chatService.GetChatRoomsForDoctor(doctorId);
        securityService.VerifyJwtOrThrow(authorization);
        return Ok(chatRooms);
    }

    [Route("chat/retreiveMessages")]
    [HttpGet]
    public async Task<ActionResult> GetChatMessages([FromQuery] RoomIdRequest roomIdRequest, [FromHeader]string authorization){
        string roomId = roomIdRequest.roomId;
        var messages = await chatService.GetMessages(roomId);
        securityService.VerifyJwtOrThrow(authorization);
        return Ok(messages);
    }

    [Route("chat/finish")]
    [HttpPut]
    public async Task<ActionResult> FinishChat([FromQuery] RoomIdRequest roomIdRequest, [FromHeader] string authorization)
    {
        securityService.VerifyJwtOrThrow(authorization);
        await chatService.FinishChat(roomIdRequest.roomId);
        return Ok();
    }


}

public class UserIdChatRoomRequest
{
    public string userId { get; set; }
}

public class RoomIdRequest{
    public string roomId {get;set;}
}
