using InfluencerApp.Domain.Models;
using Microsoft.EntityFrameworkCore;
using InfluencerApp.Domain.Repositories.Interfaces;

namespace InfluencerApp.Domain.Repositories
{
    public class OrdersRepository : Repository<Order>, IOrdersRepository
    {
        public OrdersRepository(DbContext context) : base(context)
        { }

        private ApplicationDbContext appContext
        {
            get { return (ApplicationDbContext)_context; }
        }
    }
}
