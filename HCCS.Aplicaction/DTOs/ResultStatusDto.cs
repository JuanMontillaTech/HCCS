using System;

namespace HCCS.Aplicaction.DTOs
{
    public class ResultStatusDto
    {
        public int Id { get; set; }
        public int BranchOfficeId { get; set; }
        public DateTime DateStart { get; set; }
        public DateTime DateEnd { get; set; }
        public string Code { get; set; }
        public int Sisters { get; set; }
        public int Employees { get; set; }
    }
}
