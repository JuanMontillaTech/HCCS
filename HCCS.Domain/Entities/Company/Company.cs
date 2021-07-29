using HCCS.Domain.Common;

namespace HCCS.Domain.Entities.Company
{
   public class Company : Audit
    {
        public int Id { get; set; }
        public string TaxIdentification { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Phone { get; set; }
        public byte[] Logo { get; set; }
    }
}
