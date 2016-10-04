CREATE TABLE Customer
    (
      /* Data Content */
      CustomerId INT IDENTITY
                     NOT NULL
    , [CustomerIdentifier] NVARCHAR(30) NOT NULL
    , ClientServiceId INT
    , RegistrationDate DATE NOT NULL
    , ExpiryDate DATE NOT NULL
    , Title NVARCHAR(50)
    , FirstName NVARCHAR(50)
    , MiddleName NVARCHAR(50)
    , LastName NVARCHAR(50) NOT NULL
    ,DateAdded DATETIME2(0) NOT NULL
    , AddedByFileId INT NOT NULL
    , LastUpdated DATETIME2(0) NULL
    , LastUpdatedByFileId INT NULL
    , CONSTRAINT PK_Customer PRIMARY KEY CLUSTERED ( CustomerId )
    , CONSTRAINT FK_Customer_ClientService FOREIGN KEY ( ClientServiceId ) REFERENCES dbo.ClientService ( ClientServiceId )
    , CONSTRAINT FK_CustomerAdded_Logging_ClientFileProcessing FOREIGN KEY ( AddedByFileId ) REFERENCES Logging.ClientFileProcessing ( ClientFileId )
    , CONSTRAINT FK_CustomerUpdated_Logging_ClientFileProcessing FOREIGN KEY ( LastUpdatedByFileId ) REFERENCES Logging.ClientFileProcessing ( ClientFileId )
    );

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Unique identifier from the supplier concerned. Natural Key',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Customer', @level2type = N'COLUMN',
    @level2name = 'CustomerIdentifier';
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Date the supplier says the client is registered for services from',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Customer', @level2type = N'COLUMN',
    @level2name = N'RegistrationDate';
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Date the supplier says the client is registered for services to',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Customer', @level2type = N'COLUMN',
    @level2name = N'ExpiryDate';
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'E.g. Ms, Lord, Professor Doctor, Prince',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Customer', @level2type = N'COLUMN', @level2name = N'Title';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Given name',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Customer', @level2type = N'COLUMN',
    @level2name = N'FirstName';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Family name',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Customer', @level2type = N'COLUMN',
    @level2name = N'LastName';
GO

GO

GO

GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Other names',
    @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE',
    @level1name = N'Customer', @level2type = N'COLUMN',
    @level2name = N'MiddleName';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Other Names',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Customer', @level2type = N'COLUMN',
    @level2name = N'MiddleName';
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Date/Time the record was originally added',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Customer', @level2type = N'COLUMN',
    @level2name = N'DateAdded';
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Date/Time the record was last updated', @level0type = N'SCHEMA',
    @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Customer',
    @level2type = N'COLUMN', @level2name = N'LastUpdated';
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'FK to the log entry for the file that added this record',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Customer', @level2type = N'COLUMN',
    @level2name = N'AddedByFileId';
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'FK to the log entry for the file that added last updated this record',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Customer', @level2type = N'COLUMN',
    @level2name = N'LastUpdatedByFileId';
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Surrogate Primary Key', @level0type = N'SCHEMA',
    @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Customer',
    @level2type = N'COLUMN', @level2name = N'CustomerId';
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Foreign key to the client service table',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Customer', @level2type = N'COLUMN',
    @level2name = 'ClientServiceId';