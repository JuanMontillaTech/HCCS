using HCCS.Domain.Entities.Accounting;
using System;
using System.Collections.Generic;
using System.Text;

namespace HCCS.Aplicaction.DTOs
{
   public class AccountsDto
    {
        public int Id { get; set; }
        public int TypeAcountingAcountId { get; set; }
        public bool ReadOnly { get; set; }
        public string AccountNumber { get; set; }
        public string AccountName { get; set; }
        public decimal? Amount { get; set; }
        public virtual TypeAcountingAcount TypeAcountingAcount { get; set; }
    }
}
