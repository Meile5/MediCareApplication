using Application.Interfaces.Infrastructure.Postgres.ChatRep;
using Core.Domain.Entities;
using Infrastructure.Postgres.Scaffolding;

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

    public async Task SaveMessageOnDb(Message message)
    {
        await context.Messages.AddAsync(message);
        await context.SaveChangesAsync();
    }
}