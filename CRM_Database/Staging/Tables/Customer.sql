CREATE TABLE Staging.Customer
    (
      /* Processing Control Data */
      [CustomerId] INT IDENTITY
                            NOT NULL
    , ClientFileId INT NOT NULL
    , FileRowNumber INT NOT NULL

	/* Client Data*/
    , Customerdentifier NVARCHAR(30) NOT NULL
    , ClientServiceId INT
    , RegistrationDate DATE
    , ExpiryDate DATE
    , Title NVARCHAR(50)
    , FirstName NVARCHAR(50)
    , MiddleName NVARCHAR(50)
    , LastName NVARCHAR(50)
    ,CONSTRAINT PK_StagingCustomer PRIMARY KEY CLUSTERED
        ( [CustomerId] )
    , CONSTRAINT FK_Customer_Logging_ClientFileProcessing FOREIGN KEY ( ClientFileId ) REFERENCES Logging.ClientFileProcessing ( ClientFileId )
    );

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Surrogate key, not same as CRM Customer Id',
    @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE',
    @level1name = N'Customer', @level2type = N'COLUMN',
    @level2name = 'CustomerId';
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The row number from the source file/system (calculated)',
    @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE',
    @level1name = N'Customer', @level2type = N'COLUMN',
    @level2name = N'FileRowNumber';
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Credit card or other unique identifier from the data supplier',
    @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE',
    @level1name = N'Customer', @level2type = N'COLUMN',
    @level2name = N'Customerdentifier';
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Date the supplier says the client is registered for services from',
    @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE',
    @level1name = N'Customer', @level2type = N'COLUMN',
    @level2name = N'RegistrationDate';
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Date the supplier says the client is registered for services to',
    @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE',
    @level1name = N'Customer', @level2type = N'COLUMN',
    @level2name = N'ExpiryDate';
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'E.g. Ms, Lord, Professor Doctor, Prince',
    @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE',
    @level1name = N'Customer', @level2type = N'COLUMN', @level2name = N'Title';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Given name',
    @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE',
    @level1name = N'Customer', @level2type = N'COLUMN',
    @level2name = N'FirstName';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Family name',
    @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE',
    @level1name = N'Customer', @level2type = N'COLUMN',
    @level2name = N'LastName';
GO

GO

GO

GO

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'FK to the log entry for this load', @level0type = N'SCHEMA',
    @level0name = N'Staging', @level1type = N'TABLE',
    @level1name = N'Customer', @level2type = N'COLUMN',
    @level2name = N'ClientFileId';
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The business unit ID of the client''s service',
    @level0type = N'SCHEMA',
    @level0name = N'Staging',
    @level1type = N'TABLE',
    @level1name = N'Customer',
    @level2type = N'COLUMN',
    @level2name = N'ClientServiceId'