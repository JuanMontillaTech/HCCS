using System;
using System.Collections.Generic;
using System.Text;

namespace HCCS.Domain.Common
{
    public abstract class AuditBranchOffice : Audit
    {
        public int BranchOfficeId { get; set; }
    }
}
