using InfluencerApp.Domain.Repositories.Interfaces;

namespace InfluencerApp.Domain
{
    public interface IUnitOfWork
    {
        ICustomerRepository Customers { get; }
        IProductRepository Products { get; }
        IOrdersRepository Orders { get; }


        int SaveChanges();
    }
}
