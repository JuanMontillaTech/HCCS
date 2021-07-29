using HCCS.Domain.Common;

namespace HCCS.Domain.Entities.Accounting
{
    public class ResultStatusDetails : Audit
    {
        public int Id { get; set; }
        public int ResultStatusId { get; set; }
        public int AccountingAccountNumber { get; set; }
        public int AccountingAccountId { get; set; }
        public decimal? Amount { get; set; }
        public virtual ResultStatus ResultStatus { get; set; }
    }
}
