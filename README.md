# **InfluencerApp** - ASPNET Core / Angular5 startup project template
[![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/douglasreis/influencer/blob/master/LICENSE)

A startup **Angular5 / ASP.NET Core** (cross-platform ) **project template** with an end-to-end login, user and role management implementation.
As well as other common functionalities for **Quick Application Development**.

## This application consists of:

*   Template pages using Angular5 and TypeScript
*   RESTful API Backend using ASP.NET Core MVC Web API
*   Database using Entity Framework Core
*   Authentication based on OpenID Connect
*   API Documentation using Swagger
*   [Webpack3](https://webpack.js.org) for managing client-side libraries
*   Theming using [Bootstrap](https://go.microsoft.com/fwlink/?LinkID=398939)

## You get the benefits of:

*   A complete backend and frontend project structure to build on, with login, user and permission-based role management already integrated
*   Data Access Layer built with the Repository and Unit of Work Pattern
*   Code First Database
*   A RESTful API Design
*   Angular Directives Quidance
*   Angular Pipes Quidance
*   Angular Animations Quidance
*   Angular Services
*   Dialog and Notification Services
*   Configuration Page and Configuration Service
*   Integrated Internationaliztion
*   Theming with SASS
*   Ready-to-use email API
*   Handling Access and Refresh Tokens with WebStorage (Bearer authentication) - No Cookies
*   Jquery Integration (Ability to use standard Jquery libraries)
*   CRUD APIs


## Installation

*   Coming soon...


## Installation Notes

*   When creating a new project please wait for all dependencies ("dotnet restore" & "npm install") to be restored.  
    When using VisualStudio this is automatic, check the output window or status bar to know that the package/dependencies restore process is complete before launching your program for the first time.
*   If you get this error: Unable to resolve 'OpenIddict', do the below steps to add myget.org to nuget package sources;  
    Copy the "NuGet.config" from the project folder to the solution's folder (i.e. copy to the same folder location as your solutions file) and restart your IDE  
    OR  
    Add myget.org to your package sources in VisualStudio.  
    Visual Studio -> Tools -> Options -> NuGet Package Manager -> Package Sources, Add "aspnet-contrib", this URL "https://www.myget.org/F/aspnet-contrib/api/v3/index.json"
*   If you get any other errors, consider running manually the steps to build the project and note where the errors occur.  
    Open command prompt and do the below steps:  
    1. run 'dotnet restore' from the two project folders - Restore nuget packages  
    2. run 'npm install' from the project with package.json - Restore npm packages  
    3. run 'npm run dev-build' from the project with package.json - Build webpack vendor packages  
    4. Try running the application again - Test to make sure it all works  
    


## Login

LOGIN WITH USERNAME OR EMAIL ADDRESS
> * **Default Administrator Account**
>   * Username: admin
>   * Password: tempP@ss123
> * **Default Standard Account**
>   * Username: user
>   * Password: tempP@ss123


## Documentation

*   [Conceptual overview of what is ASP.NET Core](https://go.microsoft.com/fwlink/?LinkId=518008)
*   [Angular5 documentation overview](http://angular.io/docs/ts/latest/guide)
*   [Working with Data](https://go.microsoft.com/fwlink/?LinkId=398602)
*   [An introduction to webpack](https://webpack.js.org/guides/get-started/)


## License

Released under the [MIT License](https://github.com/douglasreis/influencer/blob/master/LICENSE).

