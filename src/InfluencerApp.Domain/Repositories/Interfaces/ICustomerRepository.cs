using InfluencerApp.Domain.Models;
using System.Collections.Generic;

namespace InfluencerApp.Domain.Repositories.Interfaces
{
    public interface ICustomerRepository : IRepository<Customer>
    {
        IEnumerable<Customer> GetTopActiveCustomers(int count);
        IEnumerable<Customer> GetAllCustomersData();
    }
}
