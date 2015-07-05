
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 07/05/2015 18:24:28
-- Generated from EDMX file: C:\Users\scott_000\Documents\Projects\RecallFoodAlert\RecallFoodAlert\Model\RecallFoodAlertModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [recallAlertDb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[TextAlert]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TextAlert];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'TextAlert'
CREATE TABLE [dbo].[TextAlert] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [MobilePhone] nvarchar(15)  NOT NULL,
    [AlertType] nvarchar(30)  NOT NULL,
    [StateCode] nchar(2)  NULL,
    [RegistrationDateTime] datetime  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'TextAlert'
ALTER TABLE [dbo].[TextAlert]
ADD CONSTRAINT [PK_TextAlert]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------