
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using HCCS.Domain.Entities.Security;

namespace HCCS.Infrastructure.TableEntityConfiguration
{
    internal class GroupTableEntityConfiguration : AuditableEntityTypeConfiguration<Group>
    {
      
        public override void Configure(EntityTypeBuilder<Group> builder)
        {
          builder.HasData(new Group { Id = 1, Name = "Default", Status = true });
        }
    }
}