CREATE TABLE [Metadata].[AttributeType]
    (
      [AttributeTypeId] INT IDENTITY NOT NULL
    , [AttributeDataType] NVARCHAR(10) NOT NULL
    , [AttributeName] NVARCHAR(50) NOT NULL
    , [CategoryId] TINYINT NOT NULL DEFAULT 1, 
    CONSTRAINT PK_AttributeType PRIMARY KEY CLUSTERED ( [AttributeTypeId] ), 
    CONSTRAINT [FK_AttributeType_ToAttributeCategory] FOREIGN KEY ([CategoryId]) REFERENCES Metadata.AttributeCategory([CategoryId])
    );

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Matches the main CRM value', @level0type = N'SCHEMA',
    @level0name = N'Metadata', @level1type = N'TABLE',
    @level1name = N'AttributeType', @level2type = N'COLUMN',
    @level2name = N'AttributeTypeId';