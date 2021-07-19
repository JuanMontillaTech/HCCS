using System.Collections.Generic;

namespace HCCS.Aplicaction.DTOs
{
    public class UserAddDTO
    {      
        public string Id { get; set; }
        public bool Enable { get; set; }
        public List<UserProfileDTO> Profiles { get; set; }
    }
}