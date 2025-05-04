using Application.Interfaces.Infrastructure.Postgres.ChatRep;
using Core.Domain.Entities;
using Infrastructure.Postgres.Scaffolding;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Postgres.Postgresql.Data.ChatRepo;

public class ChatRepo(MyDbContext context) : IChatRep
{
    public async Task CreateChatRoom(ChatRoom chatRoom)
    {
        try{
        await context.ChatRooms.AddAsync(chatRoom);
        await context.SaveChangesAsync();
        } catch (Exception e){
            Console.WriteLine(e);
        }
    }

    public async Task<List<ChatRoom>> GetChatRoomsForDoctor(string doctorId)
    {
        return await context.ChatRooms
        .Where(a => a.DoctorId == doctorId)
        .ToListAsync();
    }

    public async Task<List<ChatRoom>> GetChatRoomsForPatient(string patientId)
    {
        return await context.ChatRooms
        .Where(a => a.PatientId == patientId)
        .ToListAsync();
    }

    public async Task SaveMessageOnDb(Message message)
    {
        await context.Messages.AddAsync(message);
        await context.SaveChangesAsync();
    }
}