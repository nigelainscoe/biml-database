CREATE TABLE Staging.Attribute
(
      /* Processing Control Data */
      StagingAttributeId INT IDENTITY NOT NULL
    , ClientFileId INT NOT NULL
    , FileRowNumber INT NOT NULL

	/* Data Content */
    , Customerdentifier NVARCHAR(30) NOT NULL
	, AttributeTypeID SMALLINT NOT NULL
	, AttributeValue NVARCHAR(256) NOT NULL
    , CONSTRAINT PK_StagingCustomerAttribute PRIMARY KEY CLUSTERED (StagingAttributeId)
	--, CONSTRAINT FK_CustomerAttribute_Logging_ClientFileProcessing FOREIGN KEY (ClientFileId) REFERENCES Logging.ClientFileProcessing(ClientFileId)
    );



GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The row number from the source file/system (calculated)',
    @level0type = N'SCHEMA',
    @level0name = N'Staging',
    @level1type = N'TABLE',
    @level1name = N'Attribute',
    @level2type = N'COLUMN',
    @level2name = N'FileRowNumber'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Credit card or other unique identifier from the data supplier',
    @level0type = N'SCHEMA',
    @level0name = N'Staging',
    @level1type = N'TABLE',
    @level1name = N'Attribute',
    @level2type = N'COLUMN',
    @level2name = N'Customerdentifier'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'FK to the AttributeType table on the dbo schema',
    @level0type = N'SCHEMA',
    @level0name = N'Staging',
    @level1type = N'TABLE',
    @level1name = N'Attribute',
    @level2type = N'COLUMN',
    @level2name = N'AttributeTypeID'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The value of the attribute, e.g. Green or Tuesday',
    @level0type = N'SCHEMA',
    @level0name = N'Staging',
    @level1type = N'TABLE',
    @level1name = N'Attribute',
    @level2type = N'COLUMN',
    @level2name = N'AttributeValue'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'FK to the log entry for this load',
    @level0type = N'SCHEMA',
    @level0name = N'Staging',
    @level1type = N'TABLE',
    @level1name = N'Attribute',
    @level2type = N'COLUMN',
    @level2name = N'ClientFileId'