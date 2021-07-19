using IdentityServer4.EntityFramework.DbContexts;
using IdentityServer4.EntityFramework.Entities;
using IdentityServer4.EntityFramework.Mappers;
using IdentityServer4.EntityFramework.Options;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace IdentityServer.DerivedDbContexts
{
    public class DerivedConfigurationDbContext : ConfigurationDbContext
    {
        public DerivedConfigurationDbContext(DbContextOptions<ConfigurationDbContext> options,
           ConfigurationStoreOptions storeOptions) : base(options, storeOptions)
        {

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            this.Seed(modelBuilder, new IdentityServer4.Models.IdentityResource
            {
                Name = "openid",
                DisplayName = "Información de identidad",
                Description = "Información de identidad como id, código, etc.",
                Required = true,
                UserClaims = new string[] { "sub" }
            },
            new IdentityServer4.Models.IdentityResource
            {
                Name = "profile",
                DisplayName = "Información de personal",
                Description = "Información personal como nombre, apellido, foto, etc.",
                UserClaims = new string[] { "updated_at", "firstName", "lastName", "email",
                "picture", "employeeId", "department", "title", "enable","account" }
            },
            new IdentityServer4.Models.IdentityResource
            {
                Name = "role",
                DisplayName = "Rol de usuario",
                Description = "Información de roles y permisos como, administrador, consejero, estudiante, etc.",
                UserClaims = new string[] { "role", "permission" }
            });

            this.Seed(modelBuilder, new IdentityServer4.Models.Client
            {
                ClientId = "nuxt",
                ClientName = "Cliente de la aplicación NuxtJs",

                RequireClientSecret = false,
                AllowedGrantTypes = IdentityServer4.Models.GrantTypes.Code,

                AllowRememberConsent = false,

                RedirectUris = { "http://localhost:3000/callback" },
                PostLogoutRedirectUris = { "http://localhost:3000/signed-out" },

                AllowOfflineAccess = true,
                AccessTokenLifetime = 60,
                AllowedScopes = new string[] { "openid", "profile", "con_api", "role" }
            });

            modelBuilder.Entity<ApiScope>().HasData(new ApiScope
            {
                Id = 1,
                Name = "con_api",
                DisplayName = "Web Api para sistema HCCS",
                Enabled = true,
                Emphasize = false
            });

            base.OnModelCreating(modelBuilder);
        }

        private void Seed(ModelBuilder modelBuilder, params IdentityServer4.Models.Client[] clients)
        {
            for (int i = 0; i < clients.Length; i++)
            {
                var client = clients[i].ToEntity();
                client.Id = i + 1;

                modelBuilder.Entity<Client>().HasData(client);
                modelBuilder.Entity<ClientGrantType>()
                    .HasData(client.AllowedGrantTypes.Select((x, i) => new ClientGrantType
                    {
                        ClientId = client.Id,
                        GrantType = x.GrantType,
                        Id = ++i
                    }));

                modelBuilder.Entity<ClientScope>()
                    .HasData(client.AllowedScopes.Select((x, i) => new ClientScope
                    {
                        ClientId = client.Id,
                        Scope = x.Scope,
                        Id = ++i
                    }));

                modelBuilder.Entity<ClientRedirectUri>()
                    .HasData(client.RedirectUris.Select((x, i) => new ClientRedirectUri
                    {
                        ClientId = client.Id,
                        RedirectUri = x.RedirectUri,
                        Id = ++i
                    }));

                modelBuilder.Entity<ClientPostLogoutRedirectUri>()
                    .HasData(client.PostLogoutRedirectUris.Select((x, i) => new ClientPostLogoutRedirectUri
                    {
                        ClientId = client.Id,
                        PostLogoutRedirectUri = x.PostLogoutRedirectUri,
                        Id = ++i
                    }));

                client.AllowedGrantTypes = null;
                client.AllowedScopes = null;
                client.RedirectUris = null;
                client.PostLogoutRedirectUris = null;
            }
        }

        private void Seed(ModelBuilder modelBuilder, params IdentityServer4.Models.IdentityResource[] resources)
        {
            var index = 0;
            for (int i = 0; i < resources.Length; i++)
            {
                var resource = resources[i].ToEntity();
                resource.Id = i + 1;

                modelBuilder.Entity<IdentityResource>().HasData(resource);
                modelBuilder.Entity<IdentityResourceClaim>()
                    .HasData(resource.UserClaims.Select((x, i) => new IdentityResourceClaim
                    {
                        IdentityResourceId = resource.Id,
                        Type = x.Type,
                        Id = ++index
                    }));

                resource.UserClaims = null;
            }
        }
    }
}
