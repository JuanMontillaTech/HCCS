using HCCS.Domain.Common;

namespace HCCS.Domain.Entities.Accounting
{
    public class AccountingAccount : Audit
    {
        public int Id { get; set; }
        public int TypeAcountingAcountId { get; set; }
        public bool ReadOnly { get; set; }
        public string AccountNumber { get; set; }
        public string AccountName { get; set; }     
        public virtual TypeAcountingAcount TypeAcountingAcount { get; set; }
    }
}
