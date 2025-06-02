namespace Application;

public enum ErrorCode
{
    DoctorAvailability,
    DoctorAppointments,
    Booking,
    FutureAppointments,
    PastAppointments,
    CancelAppointment,
    ClinicDoctor,
    ClinicInfo,
    PatientVitals,
    SaveVitals,
    Diagnoses,
    Patients,
    Diagnosis,
    EmptyValueValidator,
    CreateChatRoom,
    ChatRooms,
    Doctor, 
    ChatEventHandler,
    JoinRoom,
    UnsubscribeRoom,
    SubscribeVitals,
    UnsubscribeVitals,
    
}

public static class ErrorMessages
{
    private static readonly Dictionary<ErrorCode, string> _errorMessages = new()
    {
        { ErrorCode.DoctorAvailability, "Failed to get doctor availability" },
        { ErrorCode.DoctorAppointments, "Failed to get doctor appointments" },
        { ErrorCode.Booking, "Booking failed" },
        { ErrorCode.FutureAppointments, "Failed to retrieve future appointments" },
        { ErrorCode.PastAppointments, "Failed to retrieve past appointments" },
        { ErrorCode.CancelAppointment, "Cancelling appointment failed" },
        { ErrorCode.ClinicDoctor, "Failed to retrieve clinic doctor" },
        { ErrorCode.ClinicInfo, "Failed to retrieve clinic info" },
        { ErrorCode.PatientVitals, "Failed to retrieve patient vitals" },
        { ErrorCode.SaveVitals, "Failed to save patient vitals" },
        { ErrorCode.CreateChatRoom, "Failed to create chat room" },
        { ErrorCode.ChatRooms, "Failed to retreive chat rooms/messages" },
        { ErrorCode.Diagnoses, "Failed to retrieve diagnoses" },
        { ErrorCode.Patients, "Failed to retrieve patients" },
        { ErrorCode.Diagnosis, "Failed to save diagnosis" },
        { ErrorCode.EmptyValueValidator, "Empty values when validating" },
        { ErrorCode.Doctor, "Failed to retreive doctor" },
        { ErrorCode.ChatEventHandler, "Failed to broadcast messages" },
        { ErrorCode.JoinRoom, "Failed to join room" },
        { ErrorCode.UnsubscribeRoom, "Failed to leave room" },
        { ErrorCode.SubscribeVitals, "Failed to subscribe vitals" },
        { ErrorCode.UnsubscribeVitals, "Failed to unsubscribe vitals" },
        
      
    };
    
    public static string GetMessage(ErrorCode errorCode)
    {
        return _errorMessages.GetValueOrDefault(errorCode, "This error is undefined");
    }
}


