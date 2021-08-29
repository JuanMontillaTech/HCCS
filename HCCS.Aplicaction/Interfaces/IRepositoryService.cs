using HCCS.Domain.Common; 
using System.Collections.Generic; 

namespace HCCS.Aplicaction.Interfaces
{
    public interface IRepositoryService<T> where T : class 
    {
    
        T Add(T entity);
        T Get(int id);
        T Update( T entity);
        Page<T> Paginate(int page, int limit);
    }
}
