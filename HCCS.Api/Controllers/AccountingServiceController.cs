using HCCS.Aplicaction.DTOs;
using HCCS.Aplicaction.Interfaces;
using HCCS.Domain.Common;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HCCS.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountingServiceController : ControllerBase
    {
        private IAccountingService _service; 

        public AccountingServiceController(IAccountingService service)
        {
            _service = service; 
        }

        [HttpGet("ResultStatus")]
        public Page<ResultStatusDetailsDto> Get(int page = 1, int limit = 5) => this._service.Paginate(page, limit);

        [HttpGet("ResultStatus/{id}")]
        public ActionResult<ResultStatusDetailsDto> Get(int id) => this._service.GetResultStatusWithDetails(id);

        [HttpPost("ResultStatus")]
        public ActionResult<ResultStatusDetailsDto> Post(ResultStatusDetailsDto dto) {

            
            return this._service.AddResultStatusWithDetails(dto); 
        }

        [HttpPut("ResultStatus")]
        public ActionResult<ResultStatusDetailsDto> Put(int id, ResultStatusDetailsDto dto) => this._service.UpdateResultStatusWithDetails(id, dto);

        [HttpGet("Accounts")]
        public ActionResult<List<AccountsDto>> Get() => this._service.GetAllAccountingAccounts();
    }
}
