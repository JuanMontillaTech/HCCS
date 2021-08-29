using AutoMapper;
using FluentValidation;

using HCCS.Aplicaction.Interfaces;
using HCCS.Aplicaction.Service;
using HCCS.Domain.Entities.Accounting;

using Microsoft.Extensions.DependencyInjection;
using System.Reflection;

namespace HCCS.Aplicaction
{
    public static class ServiceExtensions
    {
        public static void AddApplicationLayer(this IServiceCollection services)
        {
            services.AddAutoMapper(Assembly.GetExecutingAssembly());            
            services.AddValidatorsFromAssembly(Assembly.GetExecutingAssembly()); 
            services.AddTransient<IProfileService, ProfileService>();
            services.AddTransient<IUserService, UserService>();
            services.AddTransient<IAccountingService,  AccountingService>(); 
            services.AddTransient(typeof(IRepositoryService<>), typeof(RepositoryService<>));

        }
    }
}
