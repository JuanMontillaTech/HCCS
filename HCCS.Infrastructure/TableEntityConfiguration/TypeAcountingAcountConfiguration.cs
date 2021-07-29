using HCCS.Domain.Entities.Accounting;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace HCCS.Infrastructure.TableEntityConfiguration
{
    internal class TypeAcountingAcountConfiguration : AuditableEntityTypeConfiguration<TypeAcountingAcount>
    {
        public override void Configure(EntityTypeBuilder<TypeAcountingAcount> builder)
        {

            builder.HasKey(x => x.Id);
            builder.HasData(
                          new TypeAcountingAcount { Id = 1, Description = "Activo", Credit = true, Debit = false },
                          new TypeAcountingAcount { Id = 2, Description = "Pasivo", Credit = false, Debit = true },
                          new TypeAcountingAcount { Id = 3, Description = "Patrimonio o Capital", Credit = false, Debit = true },
                          new TypeAcountingAcount { Id = 4, Description = "Ingreso", Credit = false, Debit = true },
                          new TypeAcountingAcount { Id = 5, Description = "Costos", Credit = true, Debit = false },
                          new TypeAcountingAcount { Id = 6, Description = "Gastos", Credit = true, Debit = false }
                         );
           
        }
    }
}
