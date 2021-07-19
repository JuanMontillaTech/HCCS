using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using HCCS.Domain.Common;
            
namespace HCCS.Infrastructure.TableEntityConfiguration
{
    internal class AuditableEntityTypeConfiguration<TEntity> : IEntityTypeConfiguration<TEntity>
         where TEntity : Audit
    {
        public virtual void Configure(EntityTypeBuilder<TEntity> builder)
        {
                     
            builder.Property(x => x.CreatedBy).HasMaxLength(250).IsRequired();
            builder.Property(x => x.LastModifiedDate).HasMaxLength(250).IsRequired();
            builder.Property(x => x.CreatedDate).HasMaxLength(250).IsRequired();
            builder.Property(x => x.Enable).IsRequired();
        }
    }
}
