using System.Collections.Generic; 
namespace HCCS.Domain.Common
{
    public class Page<TEntity>
    {     
        public int CurrentPage { get; set; } 
        public int TotalItems { get; set; } 
        public int TotalPages { get; set; } 
        public IList<TEntity> Items { get; set; }
    }
}
