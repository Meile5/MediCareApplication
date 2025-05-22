using Application.Interfaces;
using Application.Interfaces.IChatService;
using Application.Models.Dtos.ChatDtos;
using Microsoft.AspNetCore.Mvc;

namespace Api.Rest.Controllers.Chat;
[ApiController]
public class ChatController(IChatService chatService, ISecurityService securityService, ILogger<ChatController> logger) : ControllerBase{

    [Route("chat/create")]
    [HttpPost]
    public async Task<ActionResult> CreateChatRoom([FromBody] CreateChatRoomDto chatRoomDto, [FromHeader]string authorization){
        try
        {
            await chatService.CreateChatRoom(chatRoomDto);
            securityService.VerifyJwtOrThrow(authorization);
            return Ok();
        }
        catch (Exception e)
        {
            logger.LogError(e, "Failed to create chatroom");
            return StatusCode(500, "Internal Server Error");
        }
    }

    [Route("chat/retreiveChats/patient")]
    [HttpGet]
    public async Task<ActionResult> GetChatsForPatient([FromQuery] UserIdChatRoomRequest chatRoomRequest, [FromHeader]string authorization)
    {
        try
        {
            string patientId = chatRoomRequest.userId;
            var chatRooms = await chatService.GetChatRoomsForPatient(patientId);
            securityService.VerifyJwtOrThrow(authorization);
            return Ok(chatRooms);
        } catch (Exception e)
        {
            logger.LogError(e, "Failed to Get chats for patient");
            return StatusCode(500, "Internal Server Error");
        }
    }

    [Route("chat/retreiveChats/doctor")]
    [HttpGet]
    public async Task<ActionResult> GetChatsForDoctor([FromQuery] UserIdChatRoomRequest chatRoomRequest, [FromHeader]string authorization){
        try
        {

            string doctorId = chatRoomRequest.userId;
            var chatRooms = await chatService.GetChatRoomsForDoctor(doctorId);
            securityService.VerifyJwtOrThrow(authorization);
            return Ok(chatRooms);
        } catch (Exception e)
        {
            logger.LogError(e, "Failed to Get chats for doctor");
            return StatusCode(500, "Internal Server Error");
        }
    }

    [Route("chat/retreiveMessages")]
    [HttpGet]
    public async Task<ActionResult> GetChatMessages([FromQuery] RoomIdRequest roomIdRequest, [FromHeader]string authorization){
        try
        {
            string roomId = roomIdRequest.roomId;
            var messages = await chatService.GetMessages(roomId);
            securityService.VerifyJwtOrThrow(authorization);
            return Ok(messages);
        }
        catch (Exception e)
        {
            logger.LogError(e, "Failed to retreive messages");
            return StatusCode(500, "Internal Server Error");
        }
    }

    [Route("chat/finish")]
    [HttpPut]
    public async Task<ActionResult> FinishChat([FromQuery] RoomIdRequest roomIdRequest, [FromHeader] string authorization)
    {
        try
        {
            securityService.VerifyJwtOrThrow(authorization);
            await chatService.FinishChat(roomIdRequest.roomId);
            return Ok();
        } catch (Exception e)
        {
            logger.LogError(e, "Failed to finish chat");
            return StatusCode(500, "Internal Server Error");
        }
    }


}

public class UserIdChatRoomRequest
{
    public string userId { get; set; }
}

public class RoomIdRequest{
    public string roomId {get;set;}
}
