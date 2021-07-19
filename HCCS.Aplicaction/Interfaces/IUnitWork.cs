namespace HCCS.Aplicaction.Interfaces
{
    public interface IUnitOfWork
    {
        object GetRepository<TEntity>();
        void Commit();  

    }
}
