using Microsoft.EntityFrameworkCore;
using HCCS.Aplicaction.Interfaces;
using HCCS.Domain.Common;
using HCCS.Infrastructure.Contexts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;

namespace HCCS.Infrastructure.Persistence.Repository
{
    public class Repository<T> : IRepository<T> where T : class
    {
        private DbSet<T> _entities;
        private readonly ApplicationContext _dbContext;

        public Repository(ApplicationContext applicationContext)
        {
            _entities = applicationContext.Set<T>();
            _dbContext = applicationContext;
        }

        public void Add(T entity)
        {
            _entities.Add(entity);
        }
        public void Update(T entity)
        {

            _entities.Attach(entity);
            var entry = _dbContext.Entry(entity);
            entry.State = EntityState.Modified;
        }

        public void AddRange(IEnumerable<T> entities)
        {

            _entities.AddRange(entities);
        }

        public IQueryable<T> Find(Expression<Func<T, bool>> predicate)
        {
            return _entities.Where(predicate);
        }

        public IQueryable<T> GetAll()
        {
            return _entities.AsNoTracking().AsQueryable();

        }

        public T GetById(int id)
        {
            return _entities.Find(id);
        }

        public void Remove(T entity)
        {
            _entities.Remove(entity);
        }

        public void RemoveRange(IEnumerable<T> entities)
        {
            _entities.RemoveRange(entities);
        }




    }
}