 
using Microsoft.AspNetCore.Mvc;
using HCCS.Aplicaction.DTOs;
using HCCS.Aplicaction.Interfaces;
using HCCS.Domain.Common;
using System.Collections.Generic;

namespace HCCS.WebUI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProfileController : ControllerBase

    {
        private readonly IProfileService _profileService;

        public ProfileController( IProfileService profileService)
        {
          _profileService = profileService;
        }

        [HttpPost]
        public ProfileSingleDTO Post(ProfileSingleDTO request) => _profileService.Create(request);
            

      
        [HttpGet("enabled")]
        public IEnumerable<ProfileDto> GetAllProfilesEnabled()
        {
            var profiles = this._profileService.GetAll();
            return profiles;
        }

        [HttpPut]
        public ProfileSingleDTO Put(ProfileDto request)
        {
            return _profileService.Update(request);  
        }

        [HttpGet]
        public Page<ProfileDto> Get(int page = 1, int limit = 5) => _profileService.Paginate(page, limit);
    
        [HttpGet("permissions")]
        public IEnumerable<PermissionDto> Get()
        {
            var paged = this._profileService.GetAllPermission();
            return paged;
        }

        [HttpGet("{id}")]
        public ProfileSingleDTO Get(int id) => _profileService.GetById(id);
    }
}
