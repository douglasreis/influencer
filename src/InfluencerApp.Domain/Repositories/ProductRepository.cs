using InfluencerApp.Domain.Models;
using Microsoft.EntityFrameworkCore;
using InfluencerApp.Domain.Repositories.Interfaces;

namespace InfluencerApp.Domain.Repositories
{
    public class ProductRepository : Repository<Product>, IProductRepository
    {
        public ProductRepository(DbContext context) : base(context)
        { }

        private ApplicationDbContext appContext
        {
            get { return (ApplicationDbContext)_context; }
        }
    }
}
