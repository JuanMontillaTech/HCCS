using HCCS.Domain.Entities.Security;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using HCCS.Domain.Entities;

namespace HCCS.Infrastructure.TableEntityConfiguration
{
    internal class UsersActiveDirectoryConfiguration : IEntityTypeConfiguration<UsersActiveDirectory>
    {
        public void Configure(EntityTypeBuilder<UsersActiveDirectory> builder)
        {
          

            builder.Property(e => e.Id)
                .HasMaxLength(50);

        }
    }
}