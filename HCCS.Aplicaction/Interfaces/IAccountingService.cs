using HCCS.Aplicaction.DTOs;
using HCCS.Domain.Common;
using System;
using System.Collections.Generic;
using System.Text;

namespace HCCS.Aplicaction.Interfaces
{
    public interface IAccountingService
    { 
        List<AccountsDto> GetAllAccountingAccounts(); 
        ResultStatusDetailsDto AddResultStatusWithDetails(ResultStatusDetailsDto resultStatusDetails); 
        ResultStatusDetailsDto GetResultStatusWithDetails(int id); 
        ResultStatusDetailsDto UpdateResultStatusWithDetails(int id, ResultStatusDetailsDto resultStatusDetails);
        Page<ResultStatusDto> Paginate(int page, int limit);
    }
}
