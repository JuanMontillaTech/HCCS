using HCCS.Aplicaction.DTOs;
using HCCS.Domain.Common; 
using System.Collections.Generic; 

namespace HCCS.Aplicaction.Interfaces
{
  public interface IProfileService
    {
        ProfileSingleDTO Create(ProfileSingleDTO profileDto);
        ProfileSingleDTO Update(ProfileDto profileDto); 
        ProfileSingleDTO GetById(int id);
        IEnumerable<ProfileDto> GetAll();
        IEnumerable<PermissionDto> GetAllPermission();
        Page<ProfileDto> Paginate(int page, int limit);
    }
}
