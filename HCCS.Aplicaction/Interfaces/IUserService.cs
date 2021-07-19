using HCCS.Domain.Common;
using HCCS.Domain.Entities.Security; 
using System.Collections.Generic; 

namespace HCCS.Aplicaction.Interfaces
{
     public interface IUserService
    {
        User Create(User user);
        User Update(User user); 
        User Get(string id);  
        Page<User> Paginate(int page, int limit);
        List<UsersActiveDirectory> GetUsersActiveDirectory(string search);
    }
}
