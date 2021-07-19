using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions; 

namespace HCCS.Aplicaction.Interfaces
{
    public interface IRepository<T> where T :class 
    {
        T GetById(int id);
        IQueryable<T> GetAll();
        IQueryable<T> Find(Expression<Func<T, bool>> predicate);
        void Update(T entity);
        void Add(T entity);
        void AddRange(IEnumerable<T> entities);
        void Remove(T entity);
        void RemoveRange(IEnumerable<T> entities); 

    }
}
