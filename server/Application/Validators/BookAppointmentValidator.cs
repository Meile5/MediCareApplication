using Application.Models.Dtos.PatientDto.request;

namespace Application.Validators;
using FluentValidation;

public class BookAppointmentValidator:AbstractValidator<BookAppointmentRequest>
{
    public BookAppointmentValidator()
    {
        RuleFor(x => x.Appointment.PatientId)
            .NotEmpty().WithMessage(ErrorMessages.GetMessage(ErrorCode.EmptyValueValidator));
        
        RuleFor(x => x.Appointment.DoctorId)
            .NotEmpty().WithMessage(ErrorMessages.GetMessage(ErrorCode.EmptyValueValidator));

        RuleFor(x => x.Appointment.StartTime)
            .NotEmpty().WithMessage(ErrorMessages.GetMessage(ErrorCode.EmptyValueValidator));
        
        RuleFor(x => x.Appointment.EndTime)
            .NotEmpty().WithMessage(ErrorMessages.GetMessage(ErrorCode.EmptyValueValidator));
        
    }
}