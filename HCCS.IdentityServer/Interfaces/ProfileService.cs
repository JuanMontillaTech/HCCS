using IdentityModel;
using IdentityServer.Interfaces;
using IdentityServer4.Extensions;
using IdentityServer4.Models;
using IdentityServer4.Services;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;

namespace IdentityServer.Interface
{
    public class ProfileService : IProfileService
    {
        private readonly IUserValidator userValidator;

        public ProfileService(IUserValidator userValidator)
        {
            this.userValidator = userValidator;
        }

        public Task GetProfileDataAsync(ProfileDataRequestContext context)
        {
            var sub = context.Subject.GetSubjectId();
            var user = userValidator.FindBySubjectId(sub);

            context.IssuedClaims = new List<Claim>
            {
                new Claim(JwtClaimTypes.Name, user.Name),
                new Claim(JwtClaimTypes.GivenName, user.GivenName),
                new Claim(JwtClaimTypes.Email, user.Email),
                new Claim(JwtClaimTypes.WebSite, user.WebSite),
                new Claim("role_name", user.Role),
                new Claim("role_pers",string.Join(", ", user.Permissions))
            };

            return Task.FromResult(0);
        }

        public Task IsActiveAsync(IsActiveContext context)
        {
            var sub = context.Subject.GetSubjectId();
            var user = userValidator.FindBySubjectId(sub);
            context.IsActive = user != null;

            return Task.FromResult(0);
        }
    }
}