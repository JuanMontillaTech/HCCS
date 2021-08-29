using AutoMapper;

using HCCS.Aplicaction.Interfaces;
using HCCS.Domain.Common;

using Microsoft.EntityFrameworkCore;

using System;
using System.Collections.Generic;
using System.Linq;

namespace HCCS.Aplicaction.Service
{
    public class RepositoryService<T> : IRepositoryService<T>  where T : class
    {
        private readonly IRepository<T> _repositoryService;
        private readonly IUnitOfWork _unitOfWork;
        public RepositoryService(IUnitOfWork unitOfWork)  
        {
            _unitOfWork = unitOfWork;
            _repositoryService = (IRepository<T>)_unitOfWork.GetRepository<IRepository<T>>();

        }

        public T Add(T entity)
        {
            var result = _repositoryService.Add(entity);
            _unitOfWork.Commit();
            return result;
        }

        public T Get(int id) => _repositoryService.GetById(id);
             

        public Page<T> Paginate(int page, int limit)
        {
            var result = this._repositoryService.GetAll().AsNoTracking().Skip((page - 1) * limit).Take(limit).ToList();
            Page<T> pageFill = new Page<T>
            {
                Items = result,
                TotalItems = result.Count(),
                TotalPages = limit,
                CurrentPage = page
            };
            return pageFill;
        }

        public T Update(T entity)
        {
            _repositoryService.Update(entity);
            _unitOfWork.Commit();
            return entity;
        }

       
    }
}
