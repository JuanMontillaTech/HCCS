namespace HCCS.Domain.Entities.Security
{
 
    public class UsersActiveDirectory
    {     
        public string Id { get; set; }      
        public string EmployeeId { get; set; }
        public string FirstName { get; set; }       
        public string LastName { get; set; }     
        public string Title { get; set; }       
        public string Department { get; set; }      
        public string Email { get; set; }        
        public string AccountExpires { get; set; }
        public bool Enable { get; set; }
    }
}