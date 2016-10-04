CREATE TABLE Metadata.MappingColumn
    (
      ColumnId INT IDENTITY
                   NOT NULL
    , FileId INT NOT NULL
    , SourceColumn NVARCHAR(50) NOT NULL
	, ColumnDelimiter VARCHAR(15) NOT NULL DEFAULT 'Comma'
    , TargetTable NVARCHAR(50) NULL
    , TargetColumn NVARCHAR(50) NULL
	, TargetDataType NVARCHAR(20) NOT NULL
	, FieldLength SMALLINT
	, FieldScale TINYINT
	, IsPivot BIT NOT NULL DEFAULT ((0))
	, PivotTarget NVARCHAR(50)
    , isAttribute BIT CONSTRAINT MappingColumnIsAttributeDefault DEFAULT ((0)) NOT NULL
    , AttributeTypeId INT
    , ColumnNumber SMALLINT NOT NULL
    , CONSTRAINT PK_MappingColumn PRIMARY KEY CLUSTERED ( ColumnId ), 
    CONSTRAINT [FK_MappingColumn_ToMappingFile] FOREIGN KEY (FileId) REFERENCES [Metadata].[MappingFile]([FileId]), 
    CONSTRAINT [FK_MappingColumn_ToAttributeType] FOREIGN KEY (AttributeTypeId) REFERENCES Metadata.AttributeType(AttributeTypeId)
    );

--GO

--ALTER TABLE Staging.MappingColumn ADD CONSTRAINT MappingColumnIsAttributeDefault  DEFAULT 0 FOR isAttribute;



GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Column number - zero offset', @level0type = N'SCHEMA',
    @level0name = N'Metadata', @level1type = N'TABLE',
    @level1name = N'MappingColumn', @level2type = N'COLUMN',
    @level2name = N'ColumnNumber';
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'This will be used in the Biml File Formatter to map to to the flat file column names',
    @level0type = N'SCHEMA',
    @level0name = N'Metadata',
    @level1type = N'TABLE',
    @level1name = N'MappingColumn',
    @level2type = N'COLUMN',
    @level2name = N'TargetColumn'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The Biml data type, String, Int32 etc. Null for Attribute columns as type comes from AttributeType table',
    @level0type = N'SCHEMA',
    @level0name = N'Metadata',
    @level1type = N'TABLE',
    @level1name = N'MappingColumn',
    @level2type = N'COLUMN',
    @level2name = N'TargetDataType'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Applies to Decimal and DateTime2 fields',
    @level0type = N'SCHEMA',
    @level0name = N'Metadata',
    @level1type = N'TABLE',
    @level1name = N'MappingColumn',
    @level2type = N'COLUMN',
    @level2name = N'FieldScale'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Indicates that this field must go through an Unpivot transform',
    @level0type = N'SCHEMA',
    @level0name = N'Metadata',
    @level1type = N'TABLE',
    @level1name = N'MappingColumn',
    @level2type = N'COLUMN',
    @level2name = N'IsPivot'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The final target for the unpivoted data, e.g. PhoneNumber',
    @level0type = N'SCHEMA',
    @level0name = N'Metadata',
    @level1type = N'TABLE',
    @level1name = N'MappingColumn',
    @level2type = N'COLUMN',
    @level2name = N'PivotTarget'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The table the column data will end up in.',
    @level0type = N'SCHEMA',
    @level0name = N'Metadata',
    @level1type = N'TABLE',
    @level1name = N'MappingColumn',
    @level2type = N'COLUMN',
    @level2name = N'TargetTable'