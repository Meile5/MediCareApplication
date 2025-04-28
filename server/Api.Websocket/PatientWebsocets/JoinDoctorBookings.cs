using Application.Interfaces.Infrastructure.Websocket;
using Fleck;
using WebSocketBoilerplate;

namespace Api.Websocket.PatientWebsocets;

public class JoinDoctorBookings(IConnectionManager connectionManager) : BaseEventHandler<JoinDoctorRoomDto> 
{
    public override async Task Handle(JoinDoctorRoomDto dto, IWebSocketConnection socket)
    {
        var clientId = connectionManager.GetClientIdFromSocket(socket);
        var roomId = $"doctor_{dto.DoctorId}"; 
       
        await connectionManager.AddToTopic(roomId, clientId);
    }
}

public class JoinDoctorRoomDto : BaseDto
{
    public string DoctorId { get; set; } = string.Empty;
}