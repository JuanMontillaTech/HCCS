using System.Collections.Generic;

namespace HCCS.Aplicaction.DTOs
{
    public class UserSingleDTO : UserDTO
    {
        public List<UserProfileDTO> Profiles { get; set; }
    }
}