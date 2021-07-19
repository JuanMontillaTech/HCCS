using Microsoft.AspNetCore.Identity;
using HCCS.Aplicaction.DTOs; 
using System.Collections.Generic; 

namespace HCCS.Infrastructure.Models
{
    public class ApplicationUser : IdentityUser
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public List<RefreshTokenDto> RefreshTokens { get; set; }
        public bool OwnsToken(string token)
        {
            return this.RefreshTokens?.Find(x => x.Token == token) != null;
        }
    }
}
