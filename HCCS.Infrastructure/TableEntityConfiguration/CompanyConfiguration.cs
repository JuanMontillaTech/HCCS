using HCCS.Domain.Entities.Company;
using Microsoft.EntityFrameworkCore.Metadata.Builders; 

namespace HCCS.Infrastructure.TableEntityConfiguration
{
    class CompanyConfiguration : AuditableEntityTypeConfiguration<Company>
    {

        public override void Configure(EntityTypeBuilder<Company> builder)
        {

            builder.HasKey(x => x.Id);
            builder.HasData(
                      new Company { Id = 1,  Name = "Company Default" });
        }
    }
}
