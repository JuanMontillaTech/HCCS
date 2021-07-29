using HCCS.Domain.Entities.Accounting;
using System;
using System.Collections.Generic;
using System.Text;

namespace HCCS.Aplicaction.DTOs
{
   public  class ResultStatusDetailsDto : ResultStatusDto
    {
        public List<ResultStatusDetails>  ResultStatusDetails { get; set; }
    }
}
