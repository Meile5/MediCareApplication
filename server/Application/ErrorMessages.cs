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
    Diagnoses,
    Patients,
    Diagnosis
    
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
        { ErrorCode.Diagnoses, "Failed to retrieve diagnoses" },
        { ErrorCode.Patients, "Failed to retrieve patients" },
        { ErrorCode.Diagnosis, "Failed to save diagnsis" },


        
      
    };
    
    public static string GetMessage(ErrorCode errorCode)
    {
        return _errorMessages.GetValueOrDefault(errorCode, "This error is undefined");
    }
}


