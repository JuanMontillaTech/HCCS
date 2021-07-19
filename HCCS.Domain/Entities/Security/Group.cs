using HCCS.Domain.Common; 

namespace HCCS.Domain.Entities.Security
{
     
    public class Group : Audit
    {       
        public int Id { get; set; }       
        public string Name { get; set; }         
        public bool Status { get; set; }

    }
}
