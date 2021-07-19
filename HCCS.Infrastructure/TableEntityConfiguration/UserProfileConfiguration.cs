using HCCS.Domain.Entities.Security;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using HCCS.Domain.Entities;

namespace HCCS.Infrastructure.TableEntityConfiguration
{
    internal class UserProfileConfiguration : AuditableEntityTypeConfiguration<UserProfile>
    {
       
        public override void Configure(EntityTypeBuilder<UserProfile> builder)
        {
           
            builder.HasKey(e => new { e.UserId, e.ProfileId });         

            builder.HasOne(x => x.User)
                .WithMany(e => e.Profiles)
                .HasForeignKey(x => x.UserId); 

            base.Configure(builder);
        }
    }
}