

using HCCS.Domain.Common;

namespace HCCS.Domain.Entities.Security
{
 
    public class ProfilePermission : Audit
    {
        
        public int ProfileId { get; set; } 
        public int PermissionId { get; set; } 
        public Profile Profile { get; set; } 
        public Permission Permission { get; set; }
    }
}