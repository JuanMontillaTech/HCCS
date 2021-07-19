using HCCS.Domain.Entities.Security;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using HCCS.Domain.Entities;

namespace HCCS.Infrastructure.TableEntityConfiguration
{
    internal class UserConfiguration : AuditableEntityTypeConfiguration<User>
    {
    
        public override void Configure(EntityTypeBuilder<User> builder)
        {
          
            builder.Property(e => e.Id)
                .HasMaxLength(50);

            builder.Property(e => e.EmployeeId)
                .HasMaxLength(20);

            builder.Property(e => e.FirstName)
                .HasMaxLength(100);

            builder.Property(e => e.LastName)
                .HasMaxLength(100);

            builder.Property(e => e.Title)
                .HasMaxLength(100);

            builder.Property(e => e.Department)
                .HasMaxLength(100);

            builder.Property(e => e.Email)
                .HasMaxLength(200);

            base.Configure(builder);
        }
    }
}