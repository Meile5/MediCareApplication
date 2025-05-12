using Application.Models.Dtos;
namespace Application.Models.Dtos;
public interface IVitalsService{
    public Task SaveVitals(SaveVitalsDto saveVitalsDto);
}