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
        T Update(T entity);
        T Add(T entity);
        IEnumerable<T> AddRange(IEnumerable<T> entities);
        void Remove(T entity);
        void RemoveRange(IEnumerable<T> entities); 

    }
}
