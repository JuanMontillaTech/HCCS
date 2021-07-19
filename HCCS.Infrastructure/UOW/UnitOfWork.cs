 
using HCCS.Aplicaction.Interfaces;
using HCCS.Infrastructure.Contexts;
using System; 

namespace HCCS.Infrastructure.UOW
{
    public class UnitOfWork : IUnitOfWork 
    {
        private readonly ApplicationContext _dbContext;
        private readonly IServiceProvider _serviceProvider;
        public UnitOfWork(ApplicationContext dbContext, 
            IServiceProvider serviceProvider) 
        {
            _dbContext = dbContext;
          
            _serviceProvider = serviceProvider;
        }

         
        public void Commit()
        { 
                _dbContext.SaveChanges(); 
        }
        public object GetRepository<TEntity>()
            => (TEntity)this._serviceProvider.GetService(typeof(TEntity));
      
    }
}
