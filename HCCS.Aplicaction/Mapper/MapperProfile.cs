
using AutoMapper;
using HCCS.Domain.Entities;
using HCCS.Aplicaction.DTOs;
using HCCS.Domain.Common;

namespace HCCS.Aplicaction.Mapper
{
    public class MapperProfile :Profile
    {
        public MapperProfile()
        {
            CreateMap<Domain.Entities.Security.Profile, ProfileDto>().ReverseMap();
            CreateMap<Domain.Entities.Security.Profile, ProfileSingleDTO>().ReverseMap();
            CreateMap<Domain.Entities.Security.ProfilePermission, PermissionDto>()
             .ForMember(p => p.Id, o => o.MapFrom(x => x.PermissionId))
             .ForMember(p => p.Name, o => o.MapFrom(x => x.Permission.Name))
             .ReverseMap();
            CreateMap<Domain.Entities.Security.Permission, PermissionDto>().ReverseMap();
            CreateMap<Page<Domain.Entities.Security.UsersActiveDirectory>, Page<UserDTO>>(); 
            CreateMap<UserProfileDTO, Domain.Entities.Security.UserProfile>();
            CreateMap<Domain.Entities.Security.UserProfile, UserProfileDTO>();
            CreateMap<Domain.Entities.Security.UsersActiveDirectory, UserDTO>();
            CreateMap<Domain.Entities.Security.User, UserDTO>();
            CreateMap<Domain.Entities.Security.User, UserSingleDTO>();
            CreateMap<UserAddDTO, Domain.Entities.Security.User>();
            CreateMap<Page<Domain.Entities.Security.User>, Page<UserDTO>>();

        }
    }
}
