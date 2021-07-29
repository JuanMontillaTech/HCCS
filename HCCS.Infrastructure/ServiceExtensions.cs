using HCCS.Infrastructure.Contexts; 
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using HCCS.Aplicaction.Interfaces;  
using HCCS.Infrastructure.Persistence.Repository;
using HCCS.Infrastructure.UOW;
using HCCS.Aplicaction.Service;
namespace HCCS.Infrastructure
{
    public static class ServiceExtensions
    {
        public static void AddIdentityInfrastructure(this IServiceCollection services, IConfiguration configuration)
        {
 
           services.AddDbContext<ApplicationContext>(options =>
                options.UseSqlServer(
                    configuration.GetConnectionString("DefaultConnection"),
                    b => b.MigrationsAssembly(typeof(ApplicationContext).Assembly.FullName)));

            #region Services            
            services.AddTransient<IUnitOfWork, UnitOfWork>();
            services.AddTransient(typeof(IRepository<>), typeof(Repository<>));
            services.AddTransient<IUserService, UserService>();
            #endregion

        }
    }
}
