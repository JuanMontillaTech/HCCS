
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using HCCS.Domain.Entities.Security;

namespace HCCS.Infrastructure.TableEntityConfiguration
{
    internal class ProfileTableEntityConfiguration : AuditableEntityTypeConfiguration<Profile>
    {
      
        public override void Configure(EntityTypeBuilder<Profile> builder)
        {
            
            builder.HasIndex(e => e.Name)
                .IsUnique();

            builder.Property(e => e.Name)
                .HasMaxLength(100)
                .IsRequired();

            builder.Property(e => e.Description)
                .HasMaxLength(300);

            builder.Property(e => e.Status);

            base.Configure(builder);
        }
    }
}