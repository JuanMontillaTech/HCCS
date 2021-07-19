using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IdentityServer.Interfaces
{
    public interface IUserValidator
    {
        User FindBySubjectId(string subjectId);
        User FindByUsername(string username);
        bool ValidateCredentials(string username, string password);
    }
}
