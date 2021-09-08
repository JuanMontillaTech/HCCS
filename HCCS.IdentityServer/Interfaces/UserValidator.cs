using System;
using System.Collections.Generic;
using System.DirectoryServices;
using System.Linq; 
using System.Threading.Tasks;

namespace IdentityServer.Interfaces
{
    public class UserValidator : IUserValidator
    {
        private List<User> _users => new List<User> {
            new User
            {
                Id = "818727",
                Username = "cc",
                Password = "pa$$word123",
                Name= "Alice Smith",
                GivenName= "Alice",
                Email= "AliceSmith@email.com",
                WebSite= "http://alice.com",
                Role="Student",
                Picture="https://cdn.icon-icons.com/icons2/2550/PNG/512/user_circle_icon_152504.png",
                Permissions=new string[]{ "23","3","83"}
            },
            new User
            {
                Id = "88421113",
                Username = "bob",
                Password = "pa$$word123",
                Name= "Bob Smith",
                GivenName= "Bob",
                Email= "BobSmith@email.com",
                WebSite= "http://bob.com",
                Picture="https://cdn.icon-icons.com/icons2/2550/PNG/512/user_circle_icon_152504.png",
                Role="Adm",
                Permissions=new string[]{ "93","18","394","234","323"}
            }
        };

        public User FindBySubjectId(string subjectId)
        {
            return this._users.FirstOrDefault(x => x.Username == subjectId);
        }

        public User FindByUsername(string username)
        {
            return this._users.FirstOrDefault(x => x.Username == username);
        }

        public bool ValidateCredentials(string username, string password)
        {
            var user = this.FindByUsername(username);
            if (user != null && user.Password == password)
            {
                return true;
            }
            else return false;
        }
        /// <summary>
        /// Implementacion de login con active directori
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>

        public bool ActiveDirectoryAuthenticate(string username, string password)
        {
            bool result = false;
            using (DirectoryEntry _entry = new DirectoryEntry())
            {
                _entry.Username = username;
                _entry.Password = password;
                DirectorySearcher _searcher = new DirectorySearcher(_entry);
                _searcher.Filter = "(objectclass=user)";
                try
                {
                    SearchResult _sr = _searcher.FindOne();
                    string _name = _sr.Properties["displayname"][0].ToString();
                    result = true;
                }
                catch
                {   }
            }

            return result; //true = user authenticated!
        }


    }
    }
