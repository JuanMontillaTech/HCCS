using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IdentityServer
{
    public class User
    {
        public string Id { get; set; }

        public string Username { get; set; }
        public string Password { get; set; }

        public string Name { get; set; }
        public string GivenName { get; set; }

        public string Picture { get; set; }
        public string Email { get; set; }
        public string WebSite { get; set; }

        public string Role { get; set; }
        public string[] Permissions { get; set; }
    }
}
