using System.ComponentModel.DataAnnotations;

namespace Application.Models.Enums;

public class Status
{
    public const string Pending = "Pending";
    public const string Confirmed = "Confirmed";
    public const string Completed = "Completed";
    public const string Cancelled = "Cancelled";
    public const string Missed = "Missed";
    

}