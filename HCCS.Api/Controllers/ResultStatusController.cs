using HCCS.Aplicaction.Interfaces;
using HCCS.Domain.Common;
using HCCS.Domain.Entities.Accounting;

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
    public class ResultStatusController : ControllerBase
    {
        private IRepositoryService<ResultStatus> _service;

        public ResultStatusController(IRepositoryService<ResultStatus> service)
        {
            _service = service;
        }

        [HttpGet]
        public Page<ResultStatus> Get(int page = 1, int limit = 5) => this._service.Paginate(page, limit);

        [HttpGet("{id}")]
        public ActionResult<ResultStatus> Get(int id) => this._service.Get(id);

        [HttpPost]
        public ActionResult<ResultStatus> Post(ResultStatus dto) => this._service.Add(dto);

        [HttpPut]
        public ActionResult<ResultStatus> Put(ResultStatus dto) => this._service.Update( dto);


    }
}
