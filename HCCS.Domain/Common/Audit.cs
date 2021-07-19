 
using System; 
namespace HCCS.Domain.Common
{
    public abstract class Audit
    {
        public string LastModifiedBy { get; set; }         
        public string CreatedBy { get; set; }       
        public DateTime? LastModifiedDate { get; set; }  
        public DateTime CreatedDate { get; set; }
        public bool Enable { get; set; }
    }
}
