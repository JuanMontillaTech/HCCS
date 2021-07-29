using HCCS.Domain.Entities.Accounting;
using Microsoft.EntityFrameworkCore.Metadata.Builders; 

namespace HCCS.Infrastructure.TableEntityConfiguration
{
    internal class ResultStatusDetailsConfiguration : AuditableEntityTypeConfiguration<ResultStatus>
    {
        public override void Configure(EntityTypeBuilder<ResultStatus> builder)
        {
            builder.HasKey(x => x.Id);
        }
    }
}
