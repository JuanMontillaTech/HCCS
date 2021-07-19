using AutoMapper;
using HCCS.Aplicaction.DTOs;
using HCCS.Domain.Common;
using HCCS.Domain.Entities.Security; 
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using HCCS.Aplicaction.Interfaces;

namespace HCCS.WebUI.Controllers
{
  
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private IUserService _service;
        private IMapper _mapper;
        public UserController(IUserService service, IMapper mapper)
        {
            this._service = service;
            this._mapper = mapper;
        }

        [HttpGet]
        public Page<UserDTO> Get(int page = 1, int limit = 5)
        {
            var paged = this._service.Paginate(page, limit);
            return _mapper.Map<Page<User>, Page<UserDTO>>(paged);
        }
        [HttpGet("{id}")]
        public ActionResult<UserSingleDTO> Get(string id)
        {
            var user = this._service.Get(id);
            return this._mapper.Map<UserSingleDTO>(user);
        }

        [HttpGet("usersActiveDirectory")]
        public IEnumerable<UserDTO> GetUsersActiveDirectory(string search)
        {
            var users = this._service.GetUsersActiveDirectory(search);
            return _mapper.Map<List<UsersActiveDirectory>, List<UserDTO>>(users);
        }

        [HttpPost]
        public ActionResult<UserSingleDTO> Post(UserAddDTO dto)
        {
            var user = this._mapper.Map<User>(dto);
            this._service.Create(user);
            return this._mapper.Map<UserSingleDTO>(user);
        }

        [HttpPut]
        public ActionResult<UserSingleDTO> Put(UserAddDTO dto)
        {
            var user = _mapper.Map<User>(dto);
            this._service.Update(user);
            return this._mapper.Map<UserSingleDTO>(user);
        }
    }
}