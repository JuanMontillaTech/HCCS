using HCCS.Aplicaction;
using HCCS.Aplicaction.Interfaces;
using HCCS.Infrastructure;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;
using Microsoft.IdentityModel.Tokens;
using HCCS.WebUI.Security;
using Microsoft.AspNetCore.SpaServices.ReactDevelopmentServer;
using HCCS.Api.Helpers;

namespace HCCS.Api
{
    public class Startup
    {

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;


        }

        public IConfiguration Configuration { get; }

        public void ConfigureServices(IServiceCollection services)
        {
            #region Identity4Configure
            services.AddAuthentication("Bearer")
           .AddJwtBearer("Bearer", options =>
           {
               options.Authority = "https://localhost:5001";
               options.TokenValidationParameters = new TokenValidationParameters
               {
                   ValidateAudience = false
               };
           });


            services.AddAuthorization(options =>
            {
                options.AddPolicy(PolicyConst.ApiScope.PolicyName, policy =>
                {
                    policy.RequireAuthenticatedUser();
                    policy.RequireClaim("scope", "api1");
                });
            });

            #endregion
            services.AddControllers();
            services.AddSpaStaticFiles(options => options.RootPath = "client-app/dist");

            services.AddHttpContextAccessor();
            services.AddApplicationLayer();
            services.AddIdentityInfrastructure(Configuration);
            services.AddScoped(typeof(ICurrentUserService), typeof(CurrentUserService));
            services.AddControllers();
            services.AddCors(options =>
            {
                options.AddPolicy("SpaLocal", builder =>
                {
                    builder.AllowAnyHeader().AllowAnyMethod().AllowAnyOrigin();
                });
            });
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "HCCS.WebUI", Version = "v1" });
                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    In = ParameterLocation.Header,
                    Description = "Please insert JWT with Bearer into field",
                    Name = "Autorization",
                    Type = SecuritySchemeType.Http,
                    Scheme = "bearer"
                });
                c.AddSecurityRequirement(new OpenApiSecurityRequirement {
                {
                    new OpenApiSecurityScheme
                    {
                        Reference = new OpenApiReference
                        {
                            Type = ReferenceType.SecurityScheme,
                            Id = "Bearer"
                        }
                    },
                    new string[] { }
                }
                });
            });
            services.AddHealthChecks();
            services.AddAutoMapper(typeof(Startup));
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "HCCS.WebUI v1"));
            }
            else
            {
                app.UseHsts();
            }
            app.UseHttpsRedirection();
            app.UseRouting();
            app.UseCors("SpaLocal");
            app.UseAuthentication();
            app.UseAuthorization();
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers().RequireAuthorization(PolicyConst.ApiScope.PolicyName); 
            });


            app.UseSpaStaticFiles();
            //app.UseSpa(spa =>
            //{
            //    spa.Options.SourcePath = "client-app";
            //    if (env.IsDevelopment())
            //    {
            //        // Launch development server for Nuxt
            //        spa.UseNuxtDevelopmentServer();
            //    }
            //});
        }
    }
}
