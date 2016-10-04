CREATE TABLE Metadata.MappingFile
    (
      FileId INT IDENTITY
                 NOT NULL
    , FeedName NVARCHAR(50) NOT NULL
--    , ClientServiceId INT NOT NULL
    , FileNameIdentifier NVARCHAR(10) NOT NULL
    ,RowDelimiter NVARCHAR(4) NOT NULL
                               CONSTRAINT RowTerminatorDefault DEFAULT 'CRLF'
    , CodePage NVARCHAR(20) NOT NULL
                            DEFAULT '1252'
    , ColumnNamesInFirstDataRow BIT NOT NULL
                                    DEFAULT 1
    , IsUnicode BIT NOT NULL
                    DEFAULT 0
    , FlatFileType NVARCHAR(15) NOT NULL
                                DEFAULT 'Delimited'
    , [HeaderRowsToSkip] SMALLINT NOT NULL DEFAULT 0, 
    CONSTRAINT PK_MappingFile PRIMARY KEY CLUSTERED ( FileId )
    );


GO

GO

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'CRLF, LF or CR', @level0type = N'SCHEMA',
    @level0name = N'Metadata', @level1type = N'TABLE',
    @level1name = N'MappingFile', @level2type = N'COLUMN',
    @level2name = N'RowDelimiter';
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Maps to the SSIS Flat File Format name',
    @level0type = N'SCHEMA', @level0name = N'Metadata', @level1type = N'TABLE',
    @level1name = N'MappingFile', @level2type = N'COLUMN',
    @level2name = N'FeedName';
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'A template pattern to enable the file to be identified for processing',
    @level0type = N'SCHEMA',
    @level0name = N'Metadata',
    @level1type = N'TABLE',
    @level1name = N'MappingFile',
    @level2type = N'COLUMN',
    @level2name = N'FileNameIdentifier'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Set to 1 to indicate that the first row processed contains column names',
    @level0type = N'SCHEMA',
    @level0name = N'Metadata',
    @level1type = N'TABLE',
    @level1name = N'MappingFile',
    @level2type = N'COLUMN',
    @level2name = N'ColumnNamesInFirstDataRow'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Defaults to normal Windows codepage',
    @level0type = N'SCHEMA',
    @level0name = N'Metadata',
    @level1type = N'TABLE',
    @level1name = N'MappingFile',
    @level2type = N'COLUMN',
    @level2name = N'CodePage'