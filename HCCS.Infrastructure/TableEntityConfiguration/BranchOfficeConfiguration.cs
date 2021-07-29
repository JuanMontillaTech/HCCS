﻿using HCCS.Domain.Entities.Company;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace HCCS.Infrastructure.TableEntityConfiguration
{
  internal  class BranchOfficeConfiguration : AuditableEntityTypeConfiguration<BranchOffice>
    {

        public override void Configure(EntityTypeBuilder<BranchOffice> builder)
        {

            builder.HasKey(x => x.Id);
            builder.HasData(
                      new BranchOffice { Id = 1, CompanyId = 1, Name="Branch Default" });
        }
    }
}
