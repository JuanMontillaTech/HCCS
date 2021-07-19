using HCCS.Domain.Common;

namespace HCCS.Domain.Entities.Security
{
 
    public class UserProfile : Audit
    {
        public string UserId { get; set; }    
        public int ProfileId { get; set; }      
        public User User { get; set; }
        public Profile Profile { get; set; }
    }
}