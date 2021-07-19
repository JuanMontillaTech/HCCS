using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using HCCS.Domain.Entities.Security;
using HCCS.Infrastructure.TableEntityConfiguration;

namespace HCCS.Infrastructure.TableEntityConfiguration
{
    internal class ProfilePermissionTableEntityConfiguration : AuditableEntityTypeConfiguration<ProfilePermission>
    {
     
        public override void Configure(EntityTypeBuilder<ProfilePermission> builder)
        {
          
            builder.HasKey(e => new { e.ProfileId, e.PermissionId });

            builder.HasOne(x => x.Profile)
              .WithMany(e => e.Permissions)
              .HasForeignKey(x => x.ProfileId);

            builder.HasOne(x => x.Permission)
                .WithMany(e => e.Profiles)
                .HasForeignKey(x => x.PermissionId);

            base.Configure(builder);

        }
    }
}