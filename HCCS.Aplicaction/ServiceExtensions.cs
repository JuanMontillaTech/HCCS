using AutoMapper;
using FluentValidation;

using HCCS.Aplicaction.Interfaces;
using HCCS.Aplicaction.Service;

using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks; 

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
        }
    }
}
