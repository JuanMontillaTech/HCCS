using HCCS.Domain.Common;

namespace HCCS.Domain.Entities.Accounting
{
    public class TypeAcountingAcount : Audit
    {
        public int Id { get; set; }
        public string Description { get; set; }
        public bool Debit { get; set; }
        public bool Credit { get; set; }
    }
}
