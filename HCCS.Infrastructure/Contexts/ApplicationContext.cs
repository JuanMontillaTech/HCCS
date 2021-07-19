using HCCS.Infrastructure.Models;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;
using System.Reflection;
using HCCS.Domain.Entities;
using HCCS.Domain.Common;
using HCCS.Aplicaction.Interfaces;


namespace HCCS.Infrastructure.Contexts
{
    public class ApplicationContext : IdentityDbContext<ApplicationUser>                                   
    {
        private readonly ICurrentUserService _currentUserService;
        public ApplicationContext(DbContextOptions<ApplicationContext> options, ICurrentUserService currentUserService) : base(options)
        {
            _currentUserService = currentUserService;
        }
     
        public override int SaveChanges()
        {
            foreach (var entry in ChangeTracker.Entries<Audit>())
            {
                switch (entry.State)
                {
                    case EntityState.Added:
                        entry.Entity.CreatedDate = DateTime.Now;
                        entry.Entity.CreatedBy = _currentUserService.UserId;
                        entry.Entity.LastModifiedBy = _currentUserService.UserId;
                        entry.Entity.LastModifiedDate = DateTime.Now;
                        break;
                    case EntityState.Modified:
                        entry.Entity.LastModifiedDate = DateTime.Now;
                        entry.Entity.LastModifiedBy = _currentUserService.UserId;
                        break;
                }
            }
            return base.SaveChanges();
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
            builder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly()); 
        }

        
    }
}
