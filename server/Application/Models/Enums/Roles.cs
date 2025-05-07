using System.ComponentModel.DataAnnotations;

namespace Application.Models.Enums;

public static class Constants
{
    [Required] public static string PatientRole = "role-patient";

    [Required] public static string DoctorRole = "role-doctor";
}