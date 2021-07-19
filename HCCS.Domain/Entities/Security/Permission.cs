using HCCS.Domain.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HCCS.Domain.Entities.Security
{
  
    public class Permission : Audit
    {       
        public int Id { get; set; } 
        public string Name { get; set; } 
        public int GroupId { get; set; } 
        public bool Status { get; set; } = true; 
        public Group Group { get; set; }
        public System.Collections.Generic.List<ProfilePermission> Profiles { get; set; }
    }
}
