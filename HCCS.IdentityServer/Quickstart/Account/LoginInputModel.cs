 
using System.ComponentModel.DataAnnotations;

namespace IdentityServerHost.Quickstart.UI
{
    public class LoginInputModel
    {
        [Required, Display(Name = "Nombre de usuarios")]
        public string Username { get; set; }

        [Required, Display(Name = "Contraseña")]
        public string Password { get; set; }

        public bool RememberLogin { get; set; }
        public string ReturnUrl { get; set; }
    }
}