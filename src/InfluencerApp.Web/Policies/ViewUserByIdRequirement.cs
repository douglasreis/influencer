using InfluencerApp.Domain.Core;
using QuickApp.Helpers;
using Microsoft.AspNetCore.Authorization;
using System.Security.Claims;
using System.Threading.Tasks;

namespace QuickApp.Policies
{
    public class ViewUserByIdRequirement : IAuthorizationRequirement
    {

    }

    public class ViewUserByIdHandler : AuthorizationHandler<ViewUserByIdRequirement, string>
    {
        protected override Task HandleRequirementAsync(AuthorizationHandlerContext context, ViewUserByIdRequirement requirement, string targetUserId)
        {
            if (context.User.HasClaim(CustomClaimTypes.Permission, ApplicationPermissions.ViewUsers) || GetIsSameUser(context.User, targetUserId))
                context.Succeed(requirement);

            return Task.CompletedTask;
        }

        private bool GetIsSameUser(ClaimsPrincipal user, string targetUserId)
        {
            return Utilities.GetUserId(user) == targetUserId;
        }
    }
}
