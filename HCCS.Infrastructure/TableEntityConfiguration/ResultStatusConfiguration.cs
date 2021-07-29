using HCCS.Domain.Entities.Accounting;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace HCCS.Infrastructure.TableEntityConfiguration
{
    internal class ResultStatusConfiguration : AuditableEntityTypeConfiguration<ResultStatus>
    {

        public override void Configure(EntityTypeBuilder<ResultStatus> builder)
        {

            builder.HasKey(x => x.Id);
        }
    }
}
