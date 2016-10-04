CREATE PROCEDURE [Metadata].[GetFileData]
	@FileId int
AS

SELECT  FileId
      , FeedName
--      , ClientServiceId
      , FileNameIdentifier
      , RowDelimiter
      , CodePage
      , ColumnNamesInFirstDataRow
      , IsUnicode
      , FlatFileType
FROM    Metadata.MappingFile
WHERE   FileId = @FileId;

