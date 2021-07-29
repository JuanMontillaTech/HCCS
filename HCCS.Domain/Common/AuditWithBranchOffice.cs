using System;
using System.Collections.Generic;
using System.Text;

namespace HCCS.Domain.Common
{
    public abstract class AuditWithBranchOffice : Audit
    {
        public int Id { get; set; }
        public int BranchOfficeId { get; set; }
    }
}
