
using HCCS.Domain.Common;
using System.Collections.Generic;

namespace HCCS.Domain.Entities.Security
{  
    public class Profile: Audit
    {       
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public bool Status { get; set; } = true;
        public List<ProfilePermission> Permissions { get; set; } 

    }
}