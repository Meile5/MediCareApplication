using Application;
using Application.Interfaces.Infrastructure.Websocket;
using Fleck;
using WebSocketBoilerplate;

namespace Api.Websocket.PatientWebsocets;

public class JoinDoctorBookings(IConnectionManager connectionManager, ILogger<JoinDoctorBookings> logger) : BaseEventHandler<JoinDoctorRoomDto> 
{
    public override async Task Handle(JoinDoctorRoomDto dto, IWebSocketConnection socket)
    {
        try
        {
            var clientId = connectionManager.GetClientIdFromSocket(socket);
            var roomId = $"doctor_{dto.DoctorId}";

            await connectionManager.AddToTopic(roomId, clientId);
        }
        catch (Exception ex)
        {
            logger.LogError(ex, ErrorMessages.GetMessage(ErrorCode.JoinRoom));
        }
    }
}

public class JoinDoctorRoomDto : BaseDto
{
    public string DoctorId { get; set; } = string.Empty;
}