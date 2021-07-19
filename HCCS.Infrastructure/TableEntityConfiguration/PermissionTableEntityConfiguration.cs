
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using HCCS.Domain.Entities.Security;

namespace HCCS.Infrastructure.TableEntityConfiguration
{
    internal class PermissionTableEntityConfiguration : AuditableEntityTypeConfiguration<Permission>
    {
     
        public override void Configure(EntityTypeBuilder<Permission> builder)
        {
          
            builder.HasData(
                new Permission { Id = 1, Name = "Enviar Balances", GroupId = 1 },
                new Permission { Id = 2, Name = "Balances enviados", GroupId = 1 },
                new Permission { Id = 3, Name = "Reporte Generar", GroupId = 1 } );
        }
    }
}