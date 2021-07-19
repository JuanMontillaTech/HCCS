using IdentityModel;
using IdentityServer.Interfaces;
using IdentityServer4.Extensions;
using IdentityServer4.Models;
using IdentityServer4.Services;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace IdentityServer.Interface
{
    public class UserProfileService : IProfileService
    {
        protected readonly ILogger Logger;
        protected readonly IUserValidator Users;

        public UserProfileService(IUserValidator users, ILogger<UserProfileService> logger)
        {
            Users = users;
            Logger = logger;
        }

        public virtual Task GetProfileDataAsync(ProfileDataRequestContext context)
        {
            context.LogProfileRequest(Logger);

            if (context.RequestedClaimTypes.Any())
            {
                var user = Users.FindBySubjectId(context.Subject.GetSubjectId());
                if (user != null)
                {
                    var claims = new List<Claim>
                    {
                        new Claim(JwtClaimTypes.Name, user.Name),
                        new Claim(JwtClaimTypes.GivenName, user.GivenName),
                        new Claim(JwtClaimTypes.Email, user.Email),
                        new Claim(JwtClaimTypes.WebSite, user.WebSite),
                        new Claim(JwtClaimTypes.Picture, user.Picture),
                        new Claim("role", user.Role),
                        new Claim("permission", string.Join(", ",user.Permissions)),
                    };
                    context.AddRequestedClaims(claims);
                }
            }

            context.LogIssuedClaims(Logger);

            return Task.CompletedTask;
        }

      
        public virtual Task IsActiveAsync(IsActiveContext context)
        {
            Logger.LogDebug("IsActive called from: {caller}", context.Caller);

            var user = Users.FindBySubjectId(context.Subject.GetSubjectId());
            context.IsActive = user != null;

            return Task.CompletedTask;
        }
    }
}