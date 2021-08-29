using AutoMapper;
using HCCS.Aplicaction.DTOs;  
using HCCS.Aplicaction.Interfaces; 
using System.Collections.Generic;
using System.Linq; 
using Microsoft.EntityFrameworkCore;
using HCCS.Domain.Entities.Security;
using Profile = HCCS.Domain.Entities.Security.Profile;
using HCCS.Domain.Common;

namespace HCCS.Aplicaction.Service
{

    public class ProfileService : IProfileService
    {

        private readonly IRepository<Profile> _repository;
        private readonly IRepository<ProfilePermission> _repositoryProfilePermission;
        private readonly IRepository<Permission> _repositoryPermission;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;
        public ProfileService(IUnitOfWork unitOfWork,
             IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _repository = (IRepository<Profile>)_unitOfWork.GetRepository<IRepository<Profile>>();
            _repositoryProfilePermission = (IRepository<ProfilePermission>)_unitOfWork.GetRepository<IRepository<ProfilePermission>>();
            _repositoryPermission = (IRepository<Permission>)_unitOfWork.GetRepository<IRepository<Permission>>();
            this._mapper = mapper;
        }



        public ProfileSingleDTO Create(ProfileSingleDTO profileDto)
        {
            var profile = _mapper.Map<Profile>(profileDto);
            var permisssions = profile.Permissions;
            profile.Permissions = null;
            _repository.Add(profile);
            _unitOfWork.Commit();
            List<ProfilePermission> listPerfilePermisision = new List<ProfilePermission>();
            foreach (var permisssion in permisssions)
            {

                listPerfilePermisision.Add(new ProfilePermission() {
                    PermissionId = permisssion.PermissionId,
                    ProfileId = profile.Id,
                    Enable = true });
            }
            _repositoryProfilePermission.AddRange(listPerfilePermisision);
            _unitOfWork.Commit();
            return _mapper.Map<ProfileSingleDTO>(profile);
        }

        public void Delete(ProfileDto profile)
        {
            var dtorequest = _mapper.Map<Profile>(profile);

            _repository.Remove(dtorequest);

        }

       

        public IEnumerable<ProfileDto> GetAll()
        {
            var queryable = _repository.GetAll();
            var resultQuery = queryable.ToList();
            return _mapper.Map<ProfileDto[]>(resultQuery);
        }

        public IEnumerable<PermissionDto> GetAllPermission()
        {
            return _mapper.Map<PermissionDto[]>(_repositoryPermission.GetAll().ToList());

        }

        public ProfileSingleDTO GetById(int id)
        {
            var profile = _repository.GetById(id);
            profile.Permissions = _repositoryProfilePermission.GetAll().Where(x => x.ProfileId == profile.Id).ToList();          
            var reult = _mapper.Map<ProfileSingleDTO>(profile); 
           return reult;
        
        }


        public Page<ProfileDto> Paginate(int page, int limit)
        { 
            var profiles = _repository.GetAll().Include(x => x.Permissions).AsNoTracking().Skip((page -1 ) * limit).Take(limit).ToList();
            var result = _mapper.Map<ProfileDto[]>(profiles);
            Page<ProfileDto> page1 = new Page<ProfileDto>();
            page1.Items = result;
            page1.TotalItems = result.Count();
            page1.TotalPages = limit;
            page1.CurrentPage = page;

            return page1;
        }

   

        public ProfileSingleDTO Update(ProfileDto profileDto)
        {         
            var profileForEdit = _mapper.Map<Profile>(profileDto); 
            _repository.Update(profileForEdit);
            //var Profileedit = _repository.GetById(profileForEdit.Id);
            //Profileedit.Name = profileForEdit.Name;
            //Profileedit.Description = profileForEdit.Description;
            //profileDto.Status = profileForEdit.Status;
            _unitOfWork.Commit();
            var permisssions = _repositoryProfilePermission.GetAll().Where(x=> x.ProfileId == profileForEdit.Id).ToList();
            _repositoryProfilePermission.RemoveRange(permisssions);
            List<ProfilePermission> listPerfilePermisision = new List<ProfilePermission>();
            foreach (var permisssion in profileForEdit.Permissions)
            {

                listPerfilePermisision.Add(new ProfilePermission()
                {
                    PermissionId = permisssion.PermissionId,
                    ProfileId = profileForEdit.Id,
                    Enable = true
                });
            }
            _repositoryProfilePermission.AddRange(listPerfilePermisision);
            _unitOfWork.Commit();
            return _mapper.Map<ProfileSingleDTO>(profileDto);

        }
    }
}

