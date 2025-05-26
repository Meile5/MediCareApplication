using Application;
using Application.Interfaces.Infrastructure.Postgres.ChatRep;
using Core.Domain.Entities;
using Infrastructure.Postgres.Scaffolding;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Postgres.Postgresql.Data.ChatRepo;

public class ChatRepo(MyDbContext context, ILogger<ChatRepo> logger) : IChatRep
{
    public async Task CreateChatRoom(ChatRoom chatRoom)
    {
        try {
            await context.ChatRooms.AddAsync(chatRoom);
            await context.SaveChangesAsync();
        } catch (Exception e) {
            logger.LogError(e, ErrorMessages.GetMessage(ErrorCode.CreateChatRoom));
        }
    }

    public async Task FinishChat(string chatRoomId)
    {
        var chatRoom = await context.ChatRooms.FirstOrDefaultAsync(cr => cr.Id == chatRoomId);
        if (chatRoom != null)
        {
            chatRoom.IsFinished = true;
            await context.SaveChangesAsync();
        }
    }


    public async Task<List<ChatRoom>> GetChatRoomsForDoctor(string doctorId)
    {
        try
        {
            return await context.ChatRooms
            .Where(a => a.DoctorId == doctorId)
            .ToListAsync();
        }
        catch (Exception e)
        {
            logger.LogError(e, ErrorMessages.GetMessage(ErrorCode.ChatRooms));
            throw;
        }
    }

    public async Task<List<ChatRoom>> GetChatRoomsForPatient(string patientId)
    {
        try
        {
            return await context.ChatRooms
            .Where(a => a.PatientId == patientId)
            .ToListAsync();
        }
        catch (Exception e)
        {
            logger.LogError(e, ErrorMessages.GetMessage(ErrorCode.ChatRooms));
            throw;
        }
    }

    public async Task<List<Message>> RetreiveChatHistory(string roomId)
    {
        try
        {
            return await context.Messages
            .Where(a => a.RoomId == roomId)
            .ToListAsync();
        }
        catch (Exception e)
        {
            logger.LogError(e, ErrorMessages.GetMessage(ErrorCode.ChatRooms));
            throw;
        }
    }

    public async Task SaveMessageOnDb(Message message)
    {
        try
        {
            await context.Messages.AddAsync(message);
            await context.SaveChangesAsync();
        }
        catch (Exception e)
        {
            logger.LogError(e, "failed to save message");
        }
    }
}