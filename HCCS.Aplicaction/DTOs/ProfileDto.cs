namespace HCCS.Aplicaction.DTOs
{
    public class ProfileDto
    {
        public int Id { get; set; }       
        public string Name { get; set; }
        public string Description { get; set; }
        public bool Status { get; set; } = true;
        public System.Collections.Generic.List<PermissionDto> Permissions { get; set; }

    }
}
