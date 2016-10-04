CREATE TABLE dbo.ClientService
    (
      ClientServiceId INT NOT NULL
    , ClientId SMALLINT NOT NULL
    , ClientServiceLevel NVARCHAR(100) NOT NULL
    , CONSTRAINT PK_ClientService PRIMARY KEY CLUSTERED ( ClientServiceId )
    );

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Name of the Service Level',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'ClientService',
    @level2type = N'COLUMN',
    @level2name = N'ClientServiceLevel'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Foreign key to clients table',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'ClientService',
    @level2type = N'COLUMN',
    @level2name = N'ClientId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Surrogate primary key',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'ClientService',
    @level2type = N'COLUMN',
    @level2name = N'ClientServiceId'