SET FOREIGN_KEY_CHECKS = 1;

DROP TABLE IF EXISTS AppCustomers;

CREATE TABLE AppCustomers
(
   Id            INT            NOT NULL AUTO_INCREMENT,
   Address       VARCHAR(255),
   City          VARCHAR(255),
   CreatedBy     VARCHAR(255),
   CreatedDate   DATETIME       NOT NULL,
   DateCreated   DATETIME       NOT NULL,
   DateModified  DATETIME       NOT NULL,
   Email         VARCHAR(255),
   Gender        INT            NOT NULL,
   Name          VARCHAR(150)   NOT NULL,
   PhoneNumber   VARCHAR(30),
   UpdatedBy     VARCHAR(255),
   UpdatedDate   DATETIME       NOT NULL,
   PRIMARY KEY (Id)
);

CREATE INDEX IX_AppCustomers_Name
   ON AppCustomers (Name ASC);


DROP TABLE IF EXISTS AppProductCategories;

CREATE TABLE AppProductCategories
(
   Id            INT            NOT NULL AUTO_INCREMENT,
   CreatedBy     VARCHAR(255),
   CreatedDate   DATETIME       NOT NULL,
   DateCreated   DATETIME       NOT NULL,
   DateModified  DATETIME       NOT NULL,
   Description   VARCHAR(255),
   Icon          VARCHAR(255),
   Name          VARCHAR(150)   NOT NULL,
   UpdatedBy     VARCHAR(255),
   UpdatedDate   DATETIME       NOT NULL,
   PRIMARY KEY (Id)
);



DROP TABLE IF EXISTS AspNetRoles;

CREATE TABLE AspNetRoles
(
   Id                VARCHAR(255)   NOT NULL,
   ConcurrencyStamp  VARCHAR(255),
   CreatedBy         VARCHAR(255),
   CreatedDate       DATETIME       NOT NULL,
   Description       VARCHAR(255),
   Name              VARCHAR(150),
   NormalizedName    VARCHAR(150),
   UpdatedBy         VARCHAR(255),
   UpdatedDate       DATETIME       NOT NULL,
   PRIMARY KEY (Id)
);

CREATE UNIQUE INDEX IX_AspNetRoles_NormalizedName
   ON AspNetRoles (NormalizedName ASC);



DROP TABLE IF EXISTS AspNetUsers;

CREATE TABLE AspNetUsers
(
    Id                      VARCHAR(255)   NOT NULL,
    AccessFailedCount       INT            NOT NULL,
    ConcurrencyStamp        VARCHAR(255),
    Configuration           VARCHAR(255),
    CreatedBy               VARCHAR(255),
    CreatedDate             DATETIME       NOT NULL,
    Email                   VARCHAR(255),
    EmailConfirmed          BIT            NOT NULL,
    FullName                VARCHAR(150),
    IsEnabled               BIT            NOT NULL,
    JobTitle                VARCHAR(150),
    LockoutEnabled          BIT            NOT NULL,
    LockoutEnd              DATETIME,
    NormalizedEmail         VARCHAR(255),
    NormalizedUserName      VARCHAR(255),
    PasswordHash            VARCHAR(255),
    PhoneNumber             VARCHAR(30),
    PhoneNumberConfirmed    BIT            NOT NULL,
    SecurityStamp           VARCHAR(255),
    TwoFactorEnabled        BIT            NOT NULL,
    UpdatedBy               VARCHAR(255),
    UpdatedDate             DATETIME       NOT NULL,
    UserName                VARCHAR(255),
    PRIMARY KEY (Id)
);

CREATE INDEX IX_AspNetUsers_NormalizedEmail
   ON AspNetUsers (NormalizedEmail ASC);

CREATE UNIQUE INDEX IX_AspNetUsers_NormalizedUserName
   ON AspNetUsers (NormalizedUserName ASC);




DROP TABLE IF EXISTS OpenIddictApplications;

CREATE TABLE OpenIddictApplications
(
   Id                       VARCHAR(255)   NOT NULL,
   ClientId                 VARCHAR(255)   NOT NULL,
   ClientSecret             VARCHAR(255),
   ConcurrencyToken         VARCHAR(255),
   DisplayName              VARCHAR(150),
   PostLogoutRedirectUris   VARCHAR(255),
   RedirectUris             VARCHAR(255),
   Type                     VARCHAR(150)   NOT NULL,
   PRIMARY KEY (Id)
);

CREATE UNIQUE INDEX IX_OpenIddictApplications_ClientId
   ON OpenIddictApplications (ClientId ASC);
   


DROP TABLE IF EXISTS OpenIddictScopes;

CREATE TABLE OpenIddictScopes
(
   Id                       VARCHAR(255)   NOT NULL,
   ConcurrencyToken         VARCHAR(255),
   Description              VARCHAR(255),
   Name                     VARCHAR(150)   NOT NULL,
   PRIMARY KEY (Id)
);



DROP TABLE IF EXISTS AppProducts;

CREATE TABLE AppProducts
(
   Id                 INT            NOT NULL AUTO_INCREMENT,
   BuyingPrice        DECIMAL(10)    NOT NULL,
   CreatedBy          VARCHAR(255),
   CreatedDate        DATETIME       NOT NULL,
   DateCreated        DATETIME       NOT NULL,
   DateModified       DATETIME       NOT NULL,
   Description        VARCHAR(255),
   Icon               VARCHAR(255),
   IsActive           BIT            NOT NULL,
   IsDiscontinued     BIT            NOT NULL,
   Name               VARCHAR(150)   NOT NULL,
   ParentId           INT,
   ProductCategoryId  INT            NOT NULL,
   SellingPrice       DECIMAL(10)    NOT NULL,
   UnitsInStock       INT            NOT NULL,
   UpdatedBy          VARCHAR(255),
   UpdatedDate        DATETIME       NOT NULL,
   PRIMARY KEY (Id)
);

ALTER TABLE AppProducts
  ADD CONSTRAINT FK_AppProducts_AppProductCategories_ProductCategoryId FOREIGN KEY (ProductCategoryId)
  REFERENCES AppProductCategories (Id)
  ON UPDATE NO ACTION
  ON DELETE CASCADE;

ALTER TABLE AppProducts
  ADD CONSTRAINT FK_AppProducts_AppProducts_ParentId FOREIGN KEY (ParentId)
  REFERENCES AppProducts (Id)
  ON UPDATE NO ACTION
  ON DELETE RESTRICT;

CREATE INDEX IX_AppProducts_Name
   ON AppProducts (Name ASC);
   
CREATE INDEX IX_AppProducts_ParentId
   ON AppProducts (ParentId ASC);

CREATE INDEX IX_AppProducts_ProductCategoryId
   ON AppProducts (ProductCategoryId ASC);



DROP TABLE IF EXISTS AspNetRoleClaims;

CREATE TABLE AspNetRoleClaims
(
    Id              INT             NOT NULL AUTO_INCREMENT,
    ClaimType       VARCHAR(255),
    ClaimValue      VARCHAR(255),
    RoleId          VARCHAR(150)    NOT NULL,
    PRIMARY KEY (Id)
);

ALTER TABLE AspNetRoleClaims
  ADD CONSTRAINT FK_AspNetRoleClaims_AspNetRoles_RoleId FOREIGN KEY (RoleId)
  REFERENCES AspNetRoles (Id)
  ON UPDATE NO ACTION
  ON DELETE CASCADE;

CREATE INDEX IX_AspNetRoleClaims_RoleId
   ON AspNetRoleClaims (RoleId ASC);




DROP TABLE IF EXISTS AspNetUserClaims;

CREATE TABLE AspNetUserClaims
(
    Id              INT             NOT NULL AUTO_INCREMENT,
    ClaimType       VARCHAR(255),
    ClaimValue      VARCHAR(255),
    UserId          VARCHAR(255)    NOT NULL,
    PRIMARY KEY (Id)
);

ALTER TABLE AspNetUserClaims
  ADD CONSTRAINT FK_AspNetUserClaims_AspNetUsers_UserId FOREIGN KEY (UserId)
  REFERENCES AspNetUsers (Id)
  ON UPDATE NO ACTION
  ON DELETE CASCADE;

CREATE INDEX IX_AspNetUserClaims_UserId
   ON AspNetUserClaims (UserId ASC);


                
DROP TABLE IF EXISTS AspNetUserLogins;

CREATE TABLE AspNetUserLogins
(
    LoginProvider         VARCHAR(255)    NOT NULL,
    ProviderKey           VARCHAR(255)    NOT NULL,
    ProviderDisplayName   VARCHAR(255),
    UserId                VARCHAR(255)    NOT NULL,
    PRIMARY KEY (LoginProvider, ProviderKey)
);

ALTER TABLE AspNetUserLogins
  ADD CONSTRAINT FK_AspNetUserLogins_AspNetUsers_UserId FOREIGN KEY (UserId)
  REFERENCES AspNetUsers (Id)
  ON UPDATE NO ACTION
  ON DELETE CASCADE;

CREATE INDEX IX_AspNetUserLogins_UserId
   ON AspNetUserLogins (UserId ASC);




DROP TABLE IF EXISTS AspNetUserRoles;

CREATE TABLE AspNetUserRoles
(
    UserId      VARCHAR(255)    NOT NULL,
    RoleId      VARCHAR(255)    NOT NULL,
    PRIMARY KEY (UserId, RoleId)
);

ALTER TABLE AspNetUserRoles
  ADD CONSTRAINT FK_AspNetUserRoles_AspNetRoles_RoleId FOREIGN KEY (RoleId)
  REFERENCES AspNetRoles (Id)
  ON UPDATE NO ACTION
  ON DELETE CASCADE;

ALTER TABLE AspNetUserRoles
  ADD CONSTRAINT FK_AspNetUserRoles_AspNetUsers_UserId FOREIGN KEY (UserId)
  REFERENCES AspNetUsers (Id)
  ON UPDATE NO ACTION
  ON DELETE CASCADE;

CREATE INDEX IX_AspNetUserRoles_RoleId
   ON AspNetUserRoles (RoleId ASC);



DROP TABLE IF EXISTS AspNetUserTokens;

CREATE TABLE AspNetUserTokens
(
    UserId          VARCHAR(255)    NOT NULL,
    LoginProvider   VARCHAR(255)    NOT NULL,
    Name            VARCHAR(255)    NOT NULL,
    Value           VARCHAR(255),
    PRIMARY KEY (UserId, LoginProvider, Name)
);

ALTER TABLE AspNetUserTokens
  ADD CONSTRAINT FK_AspNetUserTokens_AspNetUsers_UserId FOREIGN KEY (UserId)
  REFERENCES AspNetUsers (Id)
  ON UPDATE NO ACTION
  ON DELETE CASCADE;


DROP TABLE IF EXISTS OpenIddictAuthorizations;

CREATE TABLE OpenIddictAuthorizations
(
    Id                      VARCHAR(255)   NOT NULL,
    ApplicationId           VARCHAR(255),
    ConcurrencyToken        VARCHAR(255),
    Scopes                  VARCHAR(255),
    Status                  VARCHAR(255)   NOT NULL,
    Subject                 VARCHAR(255)   NOT NULL,
    Type                    VARCHAR(150)   NOT NULL,
    PRIMARY KEY (Id)
);

ALTER TABLE OpenIddictAuthorizations
  ADD CONSTRAINT FK_OpenIddictAuthorizations_OpenIddictApplications_ApplicationId FOREIGN KEY (ApplicationId)
  REFERENCES OpenIddictApplications (Id)
  ON UPDATE NO ACTION
  ON DELETE RESTRICT;

CREATE INDEX IX_OpenIddictAuthorizations_ApplicationId
   ON OpenIddictAuthorizations (ApplicationId ASC);




DROP TABLE IF EXISTS OpenIddictTokens;

CREATE TABLE OpenIddictTokens
(
    Id                      VARCHAR(255)   NOT NULL,
    ApplicationId           VARCHAR(255),
    AuthorizationId         VARCHAR(255),
    ConcurrencyToken        VARCHAR(255),
    CreationDate            DATETIME,
    ExpirationDate          DATETIME,
    Payload                 VARCHAR(255),
    ReferenceId             VARCHAR(255),
    Status                  VARCHAR(255),
    Subject                 VARCHAR(255)   NOT NULL,
    Type                    VARCHAR(150)   NOT NULL,
    PRIMARY KEY (Id)
);

ALTER TABLE OpenIddictTokens
  ADD CONSTRAINT FK_OpenIddictTokens_OpenIddictApplications_ApplicationId FOREIGN KEY (ApplicationId)
  REFERENCES OpenIddictApplications (Id)
  ON UPDATE NO ACTION
  ON DELETE RESTRICT;

ALTER TABLE OpenIddictTokens
  ADD CONSTRAINT FK_OpenIddictTokens_OpenIddictAuthorizations_AuthorizationId FOREIGN KEY (AuthorizationId)
  REFERENCES OpenIddictAuthorizations (Id)
  ON UPDATE NO ACTION
  ON DELETE RESTRICT;

CREATE INDEX IX_OpenIddictTokens_ApplicationId
   ON OpenIddictTokens (ApplicationId ASC);

CREATE INDEX IX_OpenIddictTokens_AuthorizationId
   ON OpenIddictTokens (AuthorizationId ASC);

CREATE UNIQUE INDEX IX_OpenIddictTokens_ReferenceId
   ON OpenIddictTokens (ReferenceId ASC);



DROP TABLE IF EXISTS AppOrders;

CREATE TABLE AppOrders
(
    Id                INT            NOT NULL AUTO_INCREMENT,
    CashierId         VARCHAR(255),
    Comments          VARCHAR(255),
    CreatedBy         VARCHAR(255),
    CreatedDate       DATETIME       NOT NULL,
    CustomerId        INT            NOT NULL,
    DateCreated       DATETIME       NOT NULL,
    DateModified      DATETIME       NOT NULL,
    Discount          DECIMAL(10)    NOT NULL,
    UpdatedBy         VARCHAR(255),
    UpdatedDate       DATETIME       NOT NULL,
    PRIMARY KEY (Id)
);

ALTER TABLE AppOrders
  ADD CONSTRAINT FK_AppOrders_AspNetUsers_CashierId FOREIGN KEY (CashierId)
  REFERENCES AspNetUsers (Id)
  ON UPDATE NO ACTION
  ON DELETE RESTRICT;

ALTER TABLE AppOrders
  ADD CONSTRAINT FK_AppOrders_AppCustomers_CustomerId FOREIGN KEY (CustomerId)
  REFERENCES AppCustomers (Id)
  ON UPDATE NO ACTION
  ON DELETE CASCADE;

CREATE INDEX IX_AppOrders_CashierId
   ON AppOrders (CashierId ASC);

CREATE INDEX IX_AppOrders_CustomerId
   ON AppOrders (CustomerId ASC);


 




DROP TABLE IF EXISTS AppOrderDetails;

CREATE TABLE AppOrderDetails
(
    Id                INT            NOT NULL AUTO_INCREMENT,
    CreatedBy         VARCHAR(255),
    CreatedDate       DATETIME       NOT NULL,
    Discount          DECIMAL(10)    NOT NULL,
    OrderId           INT            NOT NULL,
    ProductId         INT            NOT NULL,
    Quantity          INT            NOT NULL,
    UnitPrice         DECIMAL(10)    NOT NULL,
    UpdatedBy         VARCHAR(255),
    UpdatedDate       DATETIME       NOT NULL,
    PRIMARY KEY (Id)
);

ALTER TABLE AppOrderDetails
  ADD CONSTRAINT FK_AppOrderDetails_AppOrders_OrderId FOREIGN KEY (OrderId)
  REFERENCES AppOrders (Id)
  ON UPDATE NO ACTION
  ON DELETE CASCADE;

ALTER TABLE AppOrderDetails
  ADD CONSTRAINT FK_AppOrderDetails_AppProducts_ProductId FOREIGN KEY (ProductId)
  REFERENCES AppProducts (Id)
  ON UPDATE NO ACTION
  ON DELETE CASCADE;

CREATE INDEX IX_AppOrderDetails_OrderId
   ON AppOrderDetails (OrderId ASC);

CREATE INDEX IX_AppOrderDetails_ProductId
   ON AppOrderDetails (ProductId ASC);


   


       const string adminRoleName = "administrator";
                const string userRoleName = "user";

                await EnsureRoleAsync(adminRoleName, "Default administrator", ApplicationPermissions.GetAllPermissionValues());
                await EnsureRoleAsync(userRoleName, "Default user", new string[] { });

                await CreateUserAsync("admin", "tempP@ss123", "Inbuilt Administrator", "admin@ebenmonney.com", "+1 (123) 000-0000", new string[] { adminRoleName });
                await CreateUserAsync("user", "tempP@ss123", "Inbuilt Standard User", "user@ebenmonney.com", "+1 (123) 000-0001", new string[] { userRoleName });

                _logger.LogInformation("In

