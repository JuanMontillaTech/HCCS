using Microsoft.EntityFrameworkCore;
using HCCS.Aplicaction.Interfaces;
using HCCS.Domain.Common;
using HCCS.Domain.Entities.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HCCS.Aplicaction.Service
{
    public class UserService : IUserService
    {
        private readonly IRepository<User> _repositoryUser;
        private readonly IRepository<UsersActiveDirectory> _repositoryUsersActiveDirectory;   
        private readonly IUnitOfWork _unitOfWork;
        public UserService(IRepository<User> repositoryUser, IUnitOfWork unitOfWork)
        {

            _unitOfWork = unitOfWork;
            _repositoryUser = (IRepository<User>)_unitOfWork.GetRepository<IRepository<User>>();          
            _repositoryUsersActiveDirectory = (IRepository<UsersActiveDirectory>)_unitOfWork.GetRepository<IRepository<UsersActiveDirectory>>();
          
        }

   
    
        public List<UsersActiveDirectory> GetUsersActiveDirectory(string search)
        {
               return this._repositoryUsersActiveDirectory.GetAll()
                .Where(x => x.Id.Contains(search)
                || x.EmployeeId.Contains(search)
                || x.FirstName.Contains(search)
                || x.LastName.Contains(search)
                || x.Title.Contains(search))
                .Take(10).ToList();
        }

        public Page<User> Paginate(int page, int limit)
        {

            var users = this._repositoryUser.GetAll().AsNoTracking().Skip((page - 1) * limit).Take(limit).ToList(); ;
            Page<User> pageUser = new Page<User>();
            pageUser.Items = users;
            pageUser.TotalItems = users.Count();
            pageUser.TotalPages = limit;
            pageUser.CurrentPage = page;
            return pageUser;
        }

        public User Create(User user)
        {
            var userActivo = this._repositoryUsersActiveDirectory.GetAll().Where(x => x.Id == user.Id).ToList().First();
            user.Email = userActivo.Email;
            user.FirstName = userActivo.FirstName;
            user.LastName = userActivo.LastName;
            user.Title = userActivo.Title;
            user.EmployeeId = userActivo.EmployeeId;
            user.Department = userActivo.Department;

            this._repositoryUser.Add(user);
            _unitOfWork.Commit();
            return user;
        }         

        User IUserService.Update(User user)
        {
            var userEdit = this.Get(user.Id);
            this._repositoryUser.Remove(userEdit);
            _unitOfWork.Commit();
            this.Create(user);
            return user;
        }


        public User Get(string id)
        {
            return this._repositoryUser.GetAll().Where(x => x.Id == id)
                 .Include(x => x.Profiles)
                     .ThenInclude(x => x.Profile)
                         .ThenInclude(x => x.Permissions)  
                 .FirstOrDefault();
        }
    }
}
