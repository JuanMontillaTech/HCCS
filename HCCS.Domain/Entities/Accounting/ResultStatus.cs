using HCCS.Domain.Common;
using HCCS.Domain.Entities.Company;
using System;
using System.Collections.Generic;
using System.Text;

namespace HCCS.Domain.Entities.Accounting
{
    public class ResultStatus : AuditWithBranchOffice
    {
        public string Institution { get; set; }
        public DateTime DateStart { get; set; }
        public DateTime DateEnd { get; set; }
        public string Code { get; set; }
        public int Sisters { get; set; }
        public int Employees { get; set; }    
        public List<ResultStatusDetails>   ResultStatusDetails { get; set; }
    }
}
