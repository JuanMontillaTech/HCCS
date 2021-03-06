USE [HCCSIdentity]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 9/1/2021 10:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResourceClaims]    Script Date: 9/1/2021 10:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResourceClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_ApiResourceClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResourceProperties]    Script Date: 9/1/2021 10:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResourceProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_ApiResourceProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResources]    Script Date: 9/1/2021 10:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[AllowedAccessTokenSigningAlgorithms] [nvarchar](100) NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[Updated] [datetime2](7) NULL,
	[LastAccessed] [datetime2](7) NULL,
	[NonEditable] [bit] NOT NULL,
 CONSTRAINT [PK_ApiResources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResourceScopes]    Script Date: 9/1/2021 10:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResourceScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Scope] [nvarchar](200) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_ApiResourceScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResourceSecrets]    Script Date: 9/1/2021 10:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResourceSecrets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[Expiration] [datetime2](7) NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_ApiResourceSecrets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiScopeClaims]    Script Date: 9/1/2021 10:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiScopeClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
	[ScopeId] [int] NOT NULL,
 CONSTRAINT [PK_ApiScopeClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiScopeProperties]    Script Date: 9/1/2021 10:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiScopeProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
	[ScopeId] [int] NOT NULL,
 CONSTRAINT [PK_ApiScopeProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiScopes]    Script Date: 9/1/2021 10:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[Required] [bit] NOT NULL,
	[Emphasize] [bit] NOT NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
 CONSTRAINT [PK_ApiScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientClaims]    Script Date: 9/1/2021 10:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](250) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientCorsOrigins]    Script Date: 9/1/2021 10:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientCorsOrigins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Origin] [nvarchar](150) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientCorsOrigins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientGrantTypes]    Script Date: 9/1/2021 10:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientGrantTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GrantType] [nvarchar](250) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientGrantTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientIdPRestrictions]    Script Date: 9/1/2021 10:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientIdPRestrictions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Provider] [nvarchar](200) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientIdPRestrictions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientPostLogoutRedirectUris]    Script Date: 9/1/2021 10:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientPostLogoutRedirectUris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostLogoutRedirectUri] [nvarchar](2000) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientPostLogoutRedirectUris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientProperties]    Script Date: 9/1/2021 10:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientRedirectUris]    Script Date: 9/1/2021 10:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientRedirectUris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RedirectUri] [nvarchar](2000) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientRedirectUris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 9/1/2021 10:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[ProtocolType] [nvarchar](200) NOT NULL,
	[RequireClientSecret] [bit] NOT NULL,
	[ClientName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[ClientUri] [nvarchar](2000) NULL,
	[LogoUri] [nvarchar](2000) NULL,
	[RequireConsent] [bit] NOT NULL,
	[AllowRememberConsent] [bit] NOT NULL,
	[AlwaysIncludeUserClaimsInIdToken] [bit] NOT NULL,
	[RequirePkce] [bit] NOT NULL,
	[AllowPlainTextPkce] [bit] NOT NULL,
	[RequireRequestObject] [bit] NOT NULL,
	[AllowAccessTokensViaBrowser] [bit] NOT NULL,
	[FrontChannelLogoutUri] [nvarchar](2000) NULL,
	[FrontChannelLogoutSessionRequired] [bit] NOT NULL,
	[BackChannelLogoutUri] [nvarchar](2000) NULL,
	[BackChannelLogoutSessionRequired] [bit] NOT NULL,
	[AllowOfflineAccess] [bit] NOT NULL,
	[IdentityTokenLifetime] [int] NOT NULL,
	[AllowedIdentityTokenSigningAlgorithms] [nvarchar](100) NULL,
	[AccessTokenLifetime] [int] NOT NULL,
	[AuthorizationCodeLifetime] [int] NOT NULL,
	[ConsentLifetime] [int] NULL,
	[AbsoluteRefreshTokenLifetime] [int] NOT NULL,
	[SlidingRefreshTokenLifetime] [int] NOT NULL,
	[RefreshTokenUsage] [int] NOT NULL,
	[UpdateAccessTokenClaimsOnRefresh] [bit] NOT NULL,
	[RefreshTokenExpiration] [int] NOT NULL,
	[AccessTokenType] [int] NOT NULL,
	[EnableLocalLogin] [bit] NOT NULL,
	[IncludeJwtId] [bit] NOT NULL,
	[AlwaysSendClientClaims] [bit] NOT NULL,
	[ClientClaimsPrefix] [nvarchar](200) NULL,
	[PairWiseSubjectSalt] [nvarchar](200) NULL,
	[Created] [datetime2](7) NOT NULL,
	[Updated] [datetime2](7) NULL,
	[LastAccessed] [datetime2](7) NULL,
	[UserSsoLifetime] [int] NULL,
	[UserCodeType] [nvarchar](100) NULL,
	[DeviceCodeLifetime] [int] NOT NULL,
	[NonEditable] [bit] NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientScopes]    Script Date: 9/1/2021 10:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Scope] [nvarchar](200) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientSecrets]    Script Date: 9/1/2021 10:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientSecrets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[Expiration] [datetime2](7) NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientSecrets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceCodes]    Script Date: 9/1/2021 10:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceCodes](
	[UserCode] [nvarchar](200) NOT NULL,
	[DeviceCode] [nvarchar](200) NOT NULL,
	[SubjectId] [nvarchar](200) NULL,
	[SessionId] [nvarchar](100) NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[Expiration] [datetime2](7) NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_DeviceCodes] PRIMARY KEY CLUSTERED 
(
	[UserCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityResourceClaims]    Script Date: 9/1/2021 10:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityResourceClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
	[IdentityResourceId] [int] NOT NULL,
 CONSTRAINT [PK_IdentityResourceClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityResourceProperties]    Script Date: 9/1/2021 10:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityResourceProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
	[IdentityResourceId] [int] NOT NULL,
 CONSTRAINT [PK_IdentityResourceProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityResources]    Script Date: 9/1/2021 10:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityResources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[Required] [bit] NOT NULL,
	[Emphasize] [bit] NOT NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[Updated] [datetime2](7) NULL,
	[NonEditable] [bit] NOT NULL,
 CONSTRAINT [PK_IdentityResources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersistedGrants]    Script Date: 9/1/2021 10:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersistedGrants](
	[Key] [nvarchar](200) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[SubjectId] [nvarchar](200) NULL,
	[SessionId] [nvarchar](100) NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[Expiration] [datetime2](7) NULL,
	[ConsumedTime] [datetime2](7) NULL,
	[Data] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PersistedGrants] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200522172538_Grants', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200522172542_Config', N'5.0.7')
GO
SET IDENTITY_INSERT [dbo].[ApiScopes] ON 

INSERT [dbo].[ApiScopes] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument]) VALUES (1, 1, N'api1', N'OIKOS API', NULL, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[ApiScopes] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientGrantTypes] ON 

INSERT [dbo].[ClientGrantTypes] ([Id], [GrantType], [ClientId]) VALUES (1, N'authorization_code', 1)
SET IDENTITY_INSERT [dbo].[ClientGrantTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientPostLogoutRedirectUris] ON 

INSERT [dbo].[ClientPostLogoutRedirectUris] ([Id], [PostLogoutRedirectUri], [ClientId]) VALUES (1, N'http://localhost:3000/signed-out', 1)
SET IDENTITY_INSERT [dbo].[ClientPostLogoutRedirectUris] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientRedirectUris] ON 

INSERT [dbo].[ClientRedirectUris] ([Id], [RedirectUri], [ClientId]) VALUES (1, N'http://localhost:3000/callback', 1)
SET IDENTITY_INSERT [dbo].[ClientRedirectUris] OFF
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([Id], [Enabled], [ClientId], [ProtocolType], [RequireClientSecret], [ClientName], [Description], [ClientUri], [LogoUri], [RequireConsent], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [RequirePkce], [AllowPlainTextPkce], [RequireRequestObject], [AllowAccessTokensViaBrowser], [FrontChannelLogoutUri], [FrontChannelLogoutSessionRequired], [BackChannelLogoutUri], [BackChannelLogoutSessionRequired], [AllowOfflineAccess], [IdentityTokenLifetime], [AllowedIdentityTokenSigningAlgorithms], [AccessTokenLifetime], [AuthorizationCodeLifetime], [ConsentLifetime], [AbsoluteRefreshTokenLifetime], [SlidingRefreshTokenLifetime], [RefreshTokenUsage], [UpdateAccessTokenClaimsOnRefresh], [RefreshTokenExpiration], [AccessTokenType], [EnableLocalLogin], [IncludeJwtId], [AlwaysSendClientClaims], [ClientClaimsPrefix], [PairWiseSubjectSalt], [Created], [Updated], [LastAccessed], [UserSsoLifetime], [UserCodeType], [DeviceCodeLifetime], [NonEditable]) VALUES (1, 1, N'nuxt', N'oidc', 0, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 0, 0, 0, NULL, 1, NULL, 1, 1, 300, NULL, 3600, 300, NULL, 2592000, 1296000, 1, 0, 1, 0, 1, 1, 0, N'client_', NULL, CAST(N'2021-06-20T22:11:58.3724949' AS DateTime2), NULL, NULL, NULL, NULL, 300, 0)
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientScopes] ON 

INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (1, N'openid', 1)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2, N'profile', 1)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (3, N'email', 1)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (4, N'api1', 1)
SET IDENTITY_INSERT [dbo].[ClientScopes] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientSecrets] ON 

INSERT [dbo].[ClientSecrets] ([Id], [Description], [Value], [Expiration], [Type], [Created], [ClientId]) VALUES (1, NULL, N'K7gNU3sdo+OL0wNhqoVWhr3g6s1xYv72ol/pe/Unols=', NULL, N'SharedSecret', CAST(N'2021-06-20T22:11:58.3729663' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[ClientSecrets] OFF
GO
SET IDENTITY_INSERT [dbo].[IdentityResourceClaims] ON 

INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (1, N'middle_name', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (2, N'given_name', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (3, N'family_name', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (4, N'name', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (5, N'nickname', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (6, N'preferred_username', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (7, N'profile', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (8, N'picture', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (9, N'website', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (10, N'gender', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (11, N'birthdate', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (12, N'zoneinfo', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (13, N'locale', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (14, N'updated_at', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (15, N'sub', 2)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (16, N'email', 1)
SET IDENTITY_INSERT [dbo].[IdentityResourceClaims] OFF
GO
SET IDENTITY_INSERT [dbo].[IdentityResources] ON 

INSERT [dbo].[IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (1, 1, N'profile', N'User profile', N'Your user profile information (first name, last name, etc.)', 0, 1, 1, CAST(N'2021-06-20T22:11:58.9348534' AS DateTime2), NULL, 0)
INSERT [dbo].[IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (2, 1, N'openid', N'Your user identifier', NULL, 1, 0, 1, CAST(N'2021-06-20T22:11:58.8938860' AS DateTime2), NULL, 0)
SET IDENTITY_INSERT [dbo].[IdentityResources] OFF
GO
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'+dJfGj8C/W9IDn16r/eaDAMyPSuOSHj0b0p4F6biYQg=', N'authorization_code', N'818727', N'6C248ABA1C58FCC37E573B17BD3C45E7', N'nuxt', NULL, CAST(N'2021-06-21T13:56:14.0000000' AS DateTime2), CAST(N'2021-06-21T14:01:14.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-21T13:56:14Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624283774","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"eF1OXuj5tTTcF4uEQVxKOw","WasConsentShown":false,"SessionId":"6C248ABA1C58FCC37E573B17BD3C45E7","CodeChallenge":"/HEdhhdTPwg2QhTz+RBh+uLiibUjFc3PYSOIqErqZDE=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'0jfXOjF7W7EgkXlGSK+3CsqiV0PzLOMDWhvfPR1JrfA=', N'authorization_code', N'818727', N'A8FD4B16588BE061E3FD403A5EDF32EE', N'nuxt', NULL, CAST(N'2021-06-21T00:19:55.0000000' AS DateTime2), CAST(N'2021-06-21T00:24:55.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-21T00:19:55Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624234795","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"-kGy9LgGycwWMBLsrDqpoQ","WasConsentShown":false,"SessionId":"A8FD4B16588BE061E3FD403A5EDF32EE","CodeChallenge":"TUIvwvZGiSzdUN+FBLA/nKDfzykrdCpRcokK02umucg=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'1fO1VlOvar3TPBZoUhNDF7u4iOaF/EK9EYMA7PKVs+4=', N'authorization_code', N'818727', N'20F88E36964908ADFDE8069896882859', N'nuxt', NULL, CAST(N'2021-06-20T23:43:23.0000000' AS DateTime2), CAST(N'2021-06-20T23:48:23.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-20T23:43:23Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624232603","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"K4kRjV8D27vFTeb_Ext59Q","WasConsentShown":false,"SessionId":"20F88E36964908ADFDE8069896882859","CodeChallenge":"CvJBXBULGmsUp4uKcyNn4w1XGJg6mPmuSrtu6/1Zu38=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'2S6EIC36fdvhpQ5m/MzILfJaj3w8kjT+dnOiOjLyek0=', N'authorization_code', N'818727', N'66CAB51FE035CB11BFEE567E28E573FC', N'nuxt', NULL, CAST(N'2021-06-21T14:51:13.0000000' AS DateTime2), CAST(N'2021-06-21T14:56:13.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-21T14:51:13Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624287073","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"_OCkuu6PZkHfeXIwjRVmoQ","WasConsentShown":false,"SessionId":"66CAB51FE035CB11BFEE567E28E573FC","CodeChallenge":"jGdHHejMabakx9qnMSQONEv8KdKuxFM15Qn+gydELh4=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'6eFdf7ZdutB+WVqjhVsH/0jCbc+BuNaSL360PGaSkjA=', N'authorization_code', N'818727', N'05E249D51D37AC8D75E3BB512B9CAC90', N'nuxt', NULL, CAST(N'2021-06-21T01:34:41.0000000' AS DateTime2), CAST(N'2021-06-21T01:39:41.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-21T01:34:41Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624239281","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"Iy5TyJcHKb8YW2o7lTP-jg","WasConsentShown":false,"SessionId":"05E249D51D37AC8D75E3BB512B9CAC90","CodeChallenge":"WPgR9eVix+DivDCm6QsnObw7sSfg+akb9nvoKK/jHro=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'7o0eWx5f7vDbxP9GWIV7Y4kr81tpdtusADWDCCXUI5I=', N'authorization_code', N'818727', N'D84FB3B273F0C776C6ADAF7D535CA99F', N'nuxt', NULL, CAST(N'2021-06-21T01:48:09.0000000' AS DateTime2), CAST(N'2021-06-21T01:53:09.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-21T01:48:09Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624240089","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"k0N21n3aKI9C8G2wTwnwPw","WasConsentShown":false,"SessionId":"D84FB3B273F0C776C6ADAF7D535CA99F","CodeChallenge":"MVYBNXsCI3wqs2l0Q173jr2wWmy1F6olY78/0lyRevg=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'9ZLViTyWIQUIXazVv/jND4gs3j8Q5PGE2lzRGXJVmck=', N'authorization_code', N'818727', N'F8B20DCCEC4D5F064A3252EAE48BBACB', N'nuxt', NULL, CAST(N'2021-06-21T14:52:38.0000000' AS DateTime2), CAST(N'2021-06-21T14:57:38.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-21T14:52:38Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624287158","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"uGf8A2mEv60Jw52vSDsbOA","WasConsentShown":false,"SessionId":"F8B20DCCEC4D5F064A3252EAE48BBACB","CodeChallenge":"tbj1bJIha7qk7CCe37MsufMaunbznqPzJxO0ca6CONY=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'aFihlgTWE44mS6bVv3dFaNHaenA7huMHT9KJGx0+H8g=', N'authorization_code', N'818727', N'0E4021673BE2A4DF485CA4F5D5741967', N'nuxt', NULL, CAST(N'2021-06-20T23:07:02.0000000' AS DateTime2), CAST(N'2021-06-20T23:12:02.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-20T23:07:02Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624230422","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"lkuEcAaA2uFeic4AnvBuOg","WasConsentShown":false,"SessionId":"0E4021673BE2A4DF485CA4F5D5741967","CodeChallenge":"Tl60xyyuGn5x0nWbyJ6uehi6MvbxZUQoAorJC6beuaY=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'AK+U+/3dHFeFnwtW+ukzK2Jj9YY1YeJB4b7TjCrXlg8=', N'authorization_code', N'818727', N'B2A05938A6B08823D0F0DCE184FDB746', N'nuxt', NULL, CAST(N'2021-06-21T15:02:24.0000000' AS DateTime2), CAST(N'2021-06-21T15:07:24.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-21T15:02:24Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624287732","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"P8S6cYKkA-eavr2Kw3z42g","WasConsentShown":false,"SessionId":"B2A05938A6B08823D0F0DCE184FDB746","CodeChallenge":"Posvwza+5IYXFgcIwI+vhbisLgKTMF4LmSVB/1BSq6s=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'B/+eo0mCDE2RCWkKPr0mKjGRG4lfQZLpc93u5wzM3WY=', N'authorization_code', N'818727', N'13577F7B46F21B46015384B91C90EFC1', N'nuxt', NULL, CAST(N'2021-06-21T01:09:51.0000000' AS DateTime2), CAST(N'2021-06-21T01:14:51.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-21T01:09:51Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624237791","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"DEzB5VUIu_mKsz-b2WFN8Q","WasConsentShown":false,"SessionId":"13577F7B46F21B46015384B91C90EFC1","CodeChallenge":"INE35Xalq5V/XlThN9ie2+hUK5S+ezCI87JRPHdt1xM=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'EMxV2dVk3aLkz3lqQitog6YLUR58Cf8itsswaSeguM4=', N'authorization_code', N'818727', N'3C854555475ACFE28666CAC323BEC361', N'nuxt', NULL, CAST(N'2021-06-20T22:45:17.0000000' AS DateTime2), CAST(N'2021-06-20T22:50:17.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-20T22:45:17Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624228898","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"B34PFKVoYzEYCVBOZQ8ZMw","WasConsentShown":false,"SessionId":"3C854555475ACFE28666CAC323BEC361","CodeChallenge":"IIFDf6ykkfISAncTUqbqh2dNgTYKItzMKsSdfJ+k5YE=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'GPb9U/Wkj1q8MRAgHpFvD4cMdd3c+qD8/qbMVC0OzYg=', N'authorization_code', N'818727', N'3C854555475ACFE28666CAC323BEC361', N'nuxt', NULL, CAST(N'2021-06-20T22:41:38.0000000' AS DateTime2), CAST(N'2021-06-20T22:46:38.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-20T22:41:38Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624228898","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"38fjArXiaxT4FdfkY02f5g","WasConsentShown":false,"SessionId":"3C854555475ACFE28666CAC323BEC361","CodeChallenge":"4Z0aD4Q8ovEI84WtrbkuCOBZf2yhcw4uFWqOxCTbzC0=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'gVzGzNAXgJABrurEB4mw+ZxeDLoTJbkt/iYj+/J1kHc=', N'authorization_code', N'Alice', N'00DF8517213AEDF63C62A5532F67DB26', N'nuxt', NULL, CAST(N'2021-07-29T14:24:11.0000000' AS DateTime2), CAST(N'2021-07-29T14:29:11.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-07-29T14:24:11Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"Alice","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"Alice","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1627566772","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile","api1"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"Z4_pDg0M41P2IKeVuZnvOA","WasConsentShown":false,"SessionId":"00DF8517213AEDF63C62A5532F67DB26","CodeChallenge":"pLjqdBJwP8EdvdAhrJ1Sa16zErsT+d/h2pnmYMuVIKU=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'IKuwDKmn684HztHvzoa4H3P+iKIokNc2z790KOcfUD8=', N'authorization_code', N'818727', N'63EF4C01B2391563A7B995355F2B6C4D', N'nuxt', NULL, CAST(N'2021-06-21T01:44:25.0000000' AS DateTime2), CAST(N'2021-06-21T01:49:25.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-21T01:44:25Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624239865","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"HdknmbTSRME0ucbbH4jYAw","WasConsentShown":false,"SessionId":"63EF4C01B2391563A7B995355F2B6C4D","CodeChallenge":"YQyDSh2gwWA9RsXaxI6zJsBhlTDdsFZzLZ/p+TrnZaY=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'IyerbKcAKQRExifGCaqqRV5jKO0IwnPl232H8RF8gFI=', N'authorization_code', N'818727', N'AAD23DAD8E10C81C105943949C55125A', N'nuxt', NULL, CAST(N'2021-06-21T01:43:35.0000000' AS DateTime2), CAST(N'2021-06-21T01:48:35.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-21T01:43:35Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624239815","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"Diz5Lmt7xDBhBUiqKj8V6w","WasConsentShown":false,"SessionId":"AAD23DAD8E10C81C105943949C55125A","CodeChallenge":"rSKvaf0VnoHnmx750oJX+lSzRlD+PAIE4IALHDe+gVY=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'Ja9HPxk4VT1JghUgyzheOJlWiPMyqNPEbnbom9nnyHE=', N'authorization_code', N'818727', N'12DCFE2CC5BD2191BDB42AD4303B05FC', N'nuxt', NULL, CAST(N'2021-06-21T00:48:12.0000000' AS DateTime2), CAST(N'2021-06-21T00:53:12.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-21T00:48:12Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624236492","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"KmnO-soQk2-jHmtm5_ZAlQ","WasConsentShown":false,"SessionId":"12DCFE2CC5BD2191BDB42AD4303B05FC","CodeChallenge":"+THk4l/wDxxwXPPzOB3gSIKiOc5H569KGysrFjlumF0=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'l4YuWyManRA8o5vKwjgGSt7ZqXfHqvPDnqDCSYXdCig=', N'authorization_code', N'88421113', N'5B48BEDDC7E8D731D79C3324CD651FAE', N'nuxt', NULL, CAST(N'2021-06-21T13:48:40.0000000' AS DateTime2), CAST(N'2021-06-21T13:53:40.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-21T13:48:40Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"88421113","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"manuel.made@intec.edu.do","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624283320","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"84ChYl2dhJNkh7JA2cCmBQ","WasConsentShown":false,"SessionId":"5B48BEDDC7E8D731D79C3324CD651FAE","CodeChallenge":"h7EkF8sMRaTWZdfNCs/co9gS/5vhvxd+ZA6TWUZ8/N4=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'LGdHGllKToYSEWGYtJCyab++FeN5mO9ehjojwQkmlWE=', N'authorization_code', N'818727', N'C0F34058F129EB2B514DEA0239493F9A', N'nuxt', NULL, CAST(N'2021-06-21T00:52:26.0000000' AS DateTime2), CAST(N'2021-06-21T00:57:26.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-21T00:52:26Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624236746","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"Tf9DzkwMv_HqiumTNB8y7g","WasConsentShown":false,"SessionId":"C0F34058F129EB2B514DEA0239493F9A","CodeChallenge":"ujFYlpNToB5FOWn3dGeUmrrBgSL1dxWBJXY5CHGj/Fc=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'Mpwt87d/xhFGFQWJu8Ac/LocT79Po1b3yk5WAj1clZc=', N'authorization_code', N'88421113', N'B8DE51143EDC2239498338A8A9A057CF', N'nuxt', NULL, CAST(N'2021-06-21T01:54:07.0000000' AS DateTime2), CAST(N'2021-06-21T01:59:07.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-21T01:54:07Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"88421113","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"manuel.made@intec.edu.do","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624240447","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"w1G2WnEF3OFBAn7cEMF5NQ","WasConsentShown":false,"SessionId":"B8DE51143EDC2239498338A8A9A057CF","CodeChallenge":"TeVthM3bc/vxouQNWUi8icoqPaqXrqKcY3E2UbJudzE=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'oOhD3gkOGflhoGMMcBRVJPgzEbz5arxXFNsHA1Vzw/M=', N'authorization_code', N'818727', N'3A57DC8EC57963E5BDCFB77D6DAB88AC', N'nuxt', NULL, CAST(N'2021-06-20T23:45:47.0000000' AS DateTime2), CAST(N'2021-06-20T23:50:47.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-20T23:45:47Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624232747","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"-kGy9LgGycwWMBLsrDqpoQ","WasConsentShown":false,"SessionId":"3A57DC8EC57963E5BDCFB77D6DAB88AC","CodeChallenge":"TUIvwvZGiSzdUN+FBLA/nKDfzykrdCpRcokK02umucg=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'OQ0PEuskjuoKnGMtUrKCRhZNaKKMzdI3WPZD2VwY5hI=', N'authorization_code', N'818727', N'C49CE57B073707456AB8D89A9A58832C', N'nuxt', NULL, CAST(N'2021-06-21T14:56:16.0000000' AS DateTime2), CAST(N'2021-06-21T15:01:16.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-21T14:56:16Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624287375","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"sih5-u4LlnaYk9tTld6BfA","WasConsentShown":false,"SessionId":"C49CE57B073707456AB8D89A9A58832C","CodeChallenge":"4Pk4ftFgDo5R/783KD/Ozt/u+YJLjZB66S2q+BUVWpQ=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'q3GERDQb803hT6RVPKLUlNdFaa9ryvOfI9xYhDWjnRs=', N'authorization_code', N'818727', N'E414CD5A9A4371DC6632E9F1F031F555', N'nuxt', NULL, CAST(N'2021-06-21T01:49:17.0000000' AS DateTime2), CAST(N'2021-06-21T01:54:17.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-21T01:49:17Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624240157","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"wubHb3R3z6mv-SseTEcDgw","WasConsentShown":false,"SessionId":"E414CD5A9A4371DC6632E9F1F031F555","CodeChallenge":"O0Dd1UQn2kt8es/DovsFctAKAQKdI1LIb+x8rVrzcPA=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'SCCtKBdH2d8ORvIFjC8s0dRcAsFWUOk9N6LBv0AFeCo=', N'authorization_code', N'818727', N'18D37EB1D63368C331088601C7347161', N'nuxt', NULL, CAST(N'2021-06-20T22:36:17.0000000' AS DateTime2), CAST(N'2021-06-20T22:41:17.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-20T22:36:17Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624228561","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"liQgsm-HleXTfw0L0NVurg","WasConsentShown":false,"SessionId":"18D37EB1D63368C331088601C7347161","CodeChallenge":"SLCv4V7AhgUCWt2HzRACqUOxsbCrZpSx5pRgAxitQ2c=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'stqsfSGvlhCm1B4D/t51fmCsZ5pQSEG7AjWE+rFSSGI=', N'authorization_code', N'818727', N'C858B8DA3C8879F1B3ACA319EF6DBF23', N'nuxt', NULL, CAST(N'2021-06-21T01:16:53.0000000' AS DateTime2), CAST(N'2021-06-21T01:21:53.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-21T01:16:53Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624238213","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"IetV1TQlSMTbzY1WuTSUQg","WasConsentShown":false,"SessionId":"C858B8DA3C8879F1B3ACA319EF6DBF23","CodeChallenge":"FfWFt2hJZG09/jmOxcF9xYsKtZlVAUd695qSfy7YNfA=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'SxVps1mCYCVtm0IIpE8fDXmHoeZSiGfFi/7RfGUyrXA=', N'authorization_code', N'818727', N'96AAE653A8E4032AA4827C29F68E04CD', N'nuxt', NULL, CAST(N'2021-06-21T01:12:29.0000000' AS DateTime2), CAST(N'2021-06-21T01:17:29.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-21T01:12:29Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624237948","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"w--5s7_WOpmv53w757LRcw","WasConsentShown":false,"SessionId":"96AAE653A8E4032AA4827C29F68E04CD","CodeChallenge":"8zR+YxSWnWydkaMI0cgcrX4oeGfxRbftD1nro0Zn12Y=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'v/JJfPbx2ap1fWQmIy/YYGsV7wUbOiCMo2+/L+0PN6o=', N'authorization_code', N'818727', N'411D35BB3A9D85310B1A29EAABC4A597', N'nuxt', NULL, CAST(N'2021-06-20T23:19:54.0000000' AS DateTime2), CAST(N'2021-06-20T23:24:54.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-20T23:19:54Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624231194","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"lkuEcAaA2uFeic4AnvBuOg","WasConsentShown":false,"SessionId":"411D35BB3A9D85310B1A29EAABC4A597","CodeChallenge":"Tl60xyyuGn5x0nWbyJ6uehi6MvbxZUQoAorJC6beuaY=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'VbP1uQgZ89yeb3x+BiiongkOerPbxXNCblGyRSloFzo=', N'authorization_code', N'818727', N'74562B4A3D45A75535A7FFDAA8F63477', N'nuxt', NULL, CAST(N'2021-06-21T01:22:29.0000000' AS DateTime2), CAST(N'2021-06-21T01:27:29.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-21T01:22:29Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624238549","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"MzaCsPB29XwXGfQQMDnjuw","WasConsentShown":false,"SessionId":"74562B4A3D45A75535A7FFDAA8F63477","CodeChallenge":"3bItDn4gmyNON7rznMpMahfrPlhJ6AJOhK7B628+qUo=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'vK4/Bu5ZC7FV8SkcpzGgjmlxbsf7qKt43HlNPedHbTo=', N'authorization_code', N'818727', N'C66095AF108671625C22D140C5DF3C20', N'nuxt', NULL, CAST(N'2021-06-21T00:23:26.0000000' AS DateTime2), CAST(N'2021-06-21T00:28:26.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-21T00:23:26Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624235006","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"pkRAuEpPorW5ZURdKvHiBA","WasConsentShown":false,"SessionId":"C66095AF108671625C22D140C5DF3C20","CodeChallenge":"e0I4HDf62pfvB6rdBjBuSzQVT0Yc9wQYhVHR/4qoHiA=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'vlwqcU8M14wndmPxBn76OGLjMpRgueB0HiYxqcnYZ74=', N'authorization_code', N'818727', N'ACB5D543AD6A04104BAAD7B55E03AE3C', N'nuxt', NULL, CAST(N'2021-06-21T15:24:41.0000000' AS DateTime2), CAST(N'2021-06-21T15:29:41.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-21T15:24:41Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624288666","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"WnF51KQxlb9-mBYeLV9yrA","WasConsentShown":false,"SessionId":"ACB5D543AD6A04104BAAD7B55E03AE3C","CodeChallenge":"LaZJHuRBt9J3JnBZ35hmrviCbl8DRUGW8cNTY5jiRw0=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'wbkOExchvXuT1Drwqdh6r199xRqXMuXr7+WAs7aFTLo=', N'authorization_code', N'818727', N'4234FA77B75005DB1417A79BED59EB6B', N'nuxt', NULL, CAST(N'2021-06-20T23:46:48.0000000' AS DateTime2), CAST(N'2021-06-20T23:51:48.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-20T23:46:48Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624232808","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"-kGy9LgGycwWMBLsrDqpoQ","WasConsentShown":false,"SessionId":"4234FA77B75005DB1417A79BED59EB6B","CodeChallenge":"TUIvwvZGiSzdUN+FBLA/nKDfzykrdCpRcokK02umucg=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'WIFdSq8krfbK5vJK3RGTqZ6MH5VjefE71llEn6KPgcM=', N'authorization_code', N'818727', N'6BCF838A51FEE8B62ADA296E878E8580', N'nuxt', NULL, CAST(N'2021-06-21T01:15:45.0000000' AS DateTime2), CAST(N'2021-06-21T01:20:45.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-21T01:15:45Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624238145","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"jtxO-Y4LM1S4iIMy_OPQ6g","WasConsentShown":false,"SessionId":"6BCF838A51FEE8B62ADA296E878E8580","CodeChallenge":"S32oxUfE48BwJVq1+bYYivvm1T1oBt3zBChgvV90Slk=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'xKQnv3GKxDhc6VEsOpdoKJOZNlvD47K8PxFG1chrLk8=', N'authorization_code', N'818727', N'30D6E7935A313C42286836A4B518ABED', N'nuxt', NULL, CAST(N'2021-06-21T00:19:47.0000000' AS DateTime2), CAST(N'2021-06-21T00:24:47.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-21T00:19:47Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624234787","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"9NzIO-v8--Fr4R4xIFFblA","WasConsentShown":false,"SessionId":"30D6E7935A313C42286836A4B518ABED","CodeChallenge":"8U9fKIVRectPY70xvgTMMbKu+QQfms3vLngcF5mj7+Y=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'y1dejVcchqTmCpUE9Pz/k99Yic4X73kjMQaAvQZxwAA=', N'authorization_code', N'818727', N'824A673D18CCF7D1629D5045AC6EE9C6', N'nuxt', NULL, CAST(N'2021-06-21T01:49:24.0000000' AS DateTime2), CAST(N'2021-06-21T01:54:24.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-21T01:49:24Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624240164","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"wubHb3R3z6mv-SseTEcDgw","WasConsentShown":false,"SessionId":"824A673D18CCF7D1629D5045AC6EE9C6","CodeChallenge":"O0Dd1UQn2kt8es/DovsFctAKAQKdI1LIb+x8rVrzcPA=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'yP21eciwMsruAD4xpVED7rl8aOQhEEt25wUp+zjImbg=', N'authorization_code', N'818727', N'C49CE57B073707456AB8D89A9A58832C', N'nuxt', NULL, CAST(N'2021-06-21T14:56:38.0000000' AS DateTime2), CAST(N'2021-06-21T15:01:38.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-21T14:56:38Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624287375","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"WqXdD4TJqQRYe1HczlXKsA","WasConsentShown":false,"SessionId":"C49CE57B073707456AB8D89A9A58832C","CodeChallenge":"aaie79YYFa7ZO7FXy1Q8v6qfpqen9hpu84cTB9pRjck=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'z95hzQLDgEEsxw7P/kEbMqpOIiTXlSY8vQAvFhR+Wgc=', N'authorization_code', N'818727', N'18D37EB1D63368C331088601C7347161', N'nuxt', NULL, CAST(N'2021-06-20T22:36:01.0000000' AS DateTime2), CAST(N'2021-06-20T22:41:01.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-06-20T22:36:01Z","Lifetime":300,"ClientId":"nuxt","Subject":{"AuthenticationType":"IdentityServer4","Claims":[{"Type":"sub","Value":"818727","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"OIKOS@INTEC.EDU.DO","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1624228561","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile"],"RedirectUri":"http://localhost:3000/callback","Nonce":null,"StateHash":"EDJB3dlUVg9guMzixsMtFg","WasConsentShown":false,"SessionId":"18D37EB1D63368C331088601C7347161","CodeChallenge":"hRb57qu229Qbggq+8VMiCUKG64Yi/h6euv+cVclGgxY=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
GO
ALTER TABLE [dbo].[ApiResourceClaims]  WITH CHECK ADD  CONSTRAINT [FK_ApiResourceClaims_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiResourceClaims] CHECK CONSTRAINT [FK_ApiResourceClaims_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiResourceProperties]  WITH CHECK ADD  CONSTRAINT [FK_ApiResourceProperties_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiResourceProperties] CHECK CONSTRAINT [FK_ApiResourceProperties_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiResourceScopes]  WITH CHECK ADD  CONSTRAINT [FK_ApiResourceScopes_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiResourceScopes] CHECK CONSTRAINT [FK_ApiResourceScopes_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiResourceSecrets]  WITH CHECK ADD  CONSTRAINT [FK_ApiResourceSecrets_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiResourceSecrets] CHECK CONSTRAINT [FK_ApiResourceSecrets_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiScopeClaims]  WITH CHECK ADD  CONSTRAINT [FK_ApiScopeClaims_ApiScopes_ScopeId] FOREIGN KEY([ScopeId])
REFERENCES [dbo].[ApiScopes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiScopeClaims] CHECK CONSTRAINT [FK_ApiScopeClaims_ApiScopes_ScopeId]
GO
ALTER TABLE [dbo].[ApiScopeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ApiScopeProperties_ApiScopes_ScopeId] FOREIGN KEY([ScopeId])
REFERENCES [dbo].[ApiScopes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiScopeProperties] CHECK CONSTRAINT [FK_ApiScopeProperties_ApiScopes_ScopeId]
GO
ALTER TABLE [dbo].[ClientClaims]  WITH CHECK ADD  CONSTRAINT [FK_ClientClaims_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientClaims] CHECK CONSTRAINT [FK_ClientClaims_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientCorsOrigins]  WITH CHECK ADD  CONSTRAINT [FK_ClientCorsOrigins_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientCorsOrigins] CHECK CONSTRAINT [FK_ClientCorsOrigins_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientGrantTypes]  WITH CHECK ADD  CONSTRAINT [FK_ClientGrantTypes_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientGrantTypes] CHECK CONSTRAINT [FK_ClientGrantTypes_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientIdPRestrictions]  WITH CHECK ADD  CONSTRAINT [FK_ClientIdPRestrictions_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientIdPRestrictions] CHECK CONSTRAINT [FK_ClientIdPRestrictions_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientPostLogoutRedirectUris]  WITH CHECK ADD  CONSTRAINT [FK_ClientPostLogoutRedirectUris_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientPostLogoutRedirectUris] CHECK CONSTRAINT [FK_ClientPostLogoutRedirectUris_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientProperties]  WITH CHECK ADD  CONSTRAINT [FK_ClientProperties_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientProperties] CHECK CONSTRAINT [FK_ClientProperties_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientRedirectUris]  WITH CHECK ADD  CONSTRAINT [FK_ClientRedirectUris_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientRedirectUris] CHECK CONSTRAINT [FK_ClientRedirectUris_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientScopes]  WITH CHECK ADD  CONSTRAINT [FK_ClientScopes_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientScopes] CHECK CONSTRAINT [FK_ClientScopes_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientSecrets]  WITH CHECK ADD  CONSTRAINT [FK_ClientSecrets_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientSecrets] CHECK CONSTRAINT [FK_ClientSecrets_Clients_ClientId]
GO
ALTER TABLE [dbo].[IdentityResourceClaims]  WITH CHECK ADD  CONSTRAINT [FK_IdentityResourceClaims_IdentityResources_IdentityResourceId] FOREIGN KEY([IdentityResourceId])
REFERENCES [dbo].[IdentityResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityResourceClaims] CHECK CONSTRAINT [FK_IdentityResourceClaims_IdentityResources_IdentityResourceId]
GO
ALTER TABLE [dbo].[IdentityResourceProperties]  WITH CHECK ADD  CONSTRAINT [FK_IdentityResourceProperties_IdentityResources_IdentityResourceId] FOREIGN KEY([IdentityResourceId])
REFERENCES [dbo].[IdentityResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityResourceProperties] CHECK CONSTRAINT [FK_IdentityResourceProperties_IdentityResources_IdentityResourceId]
GO
