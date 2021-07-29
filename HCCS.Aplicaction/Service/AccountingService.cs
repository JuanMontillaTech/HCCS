using AutoMapper;
using HCCS.Aplicaction.DTOs;
using HCCS.Aplicaction.Interfaces;
using HCCS.Domain.Common;
using HCCS.Domain.Entities.Accounting;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace HCCS.Aplicaction.Service
{
    public class AccountingService : IAccountingService
    {
        private readonly IRepository<AccountingAccount> _repositoryAccountingAccount;
        private readonly IRepository<ResultStatus> _repositoryResultStatus;
        private readonly IRepository<ResultStatusDetails> _repositoryResultStatusDetails;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;
        public AccountingService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _repositoryAccountingAccount = (IRepository<AccountingAccount>)_unitOfWork.GetRepository<IRepository<AccountingAccount>>();
            _repositoryResultStatus = (IRepository<ResultStatus>)_unitOfWork.GetRepository<IRepository<ResultStatus>>();
            _repositoryResultStatusDetails = (IRepository<ResultStatusDetails>)_unitOfWork.GetRepository<IRepository<ResultStatusDetails>>();
            this._mapper = mapper;
        }

        public ResultStatusDetailsDto AddResultStatusWithDetails(ResultStatusDetailsDto resultStatusDetails)
        {

            ResultStatus addResultStatus = _mapper.Map<ResultStatus>(resultStatusDetails);
            _repositoryResultStatus.Add(addResultStatus);
            _unitOfWork.Commit();
            resultStatusDetails.ResultStatusDetails.Select(c => { c.ResultStatusId = addResultStatus.Id; return c; }).ToList();
            _repositoryResultStatusDetails.Add(_mapper.Map<ResultStatusDetails>(resultStatusDetails.ResultStatusDetails));
            _unitOfWork.Commit();
            return resultStatusDetails;

        }

        public List<AccountsDto> GetAllAccountingAccounts() => _mapper.Map<List<AccountsDto>>(_repositoryAccountingAccount.GetAll().Include(x => x.TypeAcountingAcount));


        public ResultStatusDetailsDto GetResultStatusWithDetails(int id) => _mapper.Map<ResultStatusDetailsDto>(_repositoryResultStatus.GetAll().Include(x => x.ResultStatusDetails).Where(x => x.Id == id).First());

        public Page<ResultStatusDetailsDto> Paginate(int page, int limit)
        {
            var resultstatusdetails = _mapper.Map<List<ResultStatusDetailsDto>>(this._repositoryResultStatus.GetAll().Include(x => x.ResultStatusDetails).AsNoTracking().Skip((page - 1) * limit).Take(limit).ToList());
            Page<ResultStatusDetailsDto> pageFill = new Page<ResultStatusDetailsDto>();
            pageFill.Items = resultstatusdetails;
            pageFill.TotalItems = resultstatusdetails.Count();
            pageFill.TotalPages = limit;
            pageFill.CurrentPage = page;
            return pageFill;
        }

        public ResultStatusDetailsDto UpdateResultStatusWithDetails(int id, ResultStatusDetailsDto resultStatusDetails)
        {
            ResultStatus addResultStatus = _mapper.Map<ResultStatus>(resultStatusDetails);
            _repositoryResultStatus.Update(addResultStatus);
            _unitOfWork.Commit();
            resultStatusDetails.ResultStatusDetails.Select(c => { c.ResultStatusId = addResultStatus.Id; return c; }).ToList();
            _repositoryResultStatusDetails.Update(_mapper.Map<ResultStatusDetails>(resultStatusDetails.ResultStatusDetails));
            _unitOfWork.Commit();
            return resultStatusDetails;
        }
    }
}
