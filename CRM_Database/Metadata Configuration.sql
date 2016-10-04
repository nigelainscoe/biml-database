USE CRM;

TRUNCATE TABLE Metadata.MappingColumn
DELETE Metadata.MappingFile
DELETE Metadata.AttributeType
DELETE Metadata.AttributeCategory



SET IDENTITY_INSERT Metadata.AttributeCategory ON
INSERT INTO Metadata.AttributeCategory (CategoryId, CategoryName, IsDemographic, IsSensitive) VALUES (1, N'General', 0, 0)
SET IDENTITY_INSERT Metadata.AttributeCategory OFF

SET IDENTITY_INSERT Metadata.AttributeType ON
INSERT INTO Metadata.AttributeType (AttributeTypeId, AttributeDataType, AttributeName, CategoryId) VALUES (1, N'Char', N'Private Banker Name', 1)
INSERT INTO Metadata.AttributeType (AttributeTypeId, AttributeDataType, AttributeName, CategoryId) VALUES (2, N'Char', N'Private Banker Phone', 1)
SET IDENTITY_INSERT Metadata.AttributeType OFF


SET IDENTITY_INSERT Metadata.MappingFile ON;
INSERT INTO Metadata.MappingFile (FileId, FeedName, FileNameIdentifier, RowDelimiter, CodePage, ColumnNamesInFirstDataRow, IsUnicode, FlatFileType, HeaderRowsToSkip) VALUES (1, N'OnlineStore', N'ABCDE', N'CRLF', N'1252', 1, 0, N'Delimited', 0)
INSERT INTO Metadata.MappingFile (FileId, FeedName, FileNameIdentifier, RowDelimiter, CodePage, ColumnNamesInFirstDataRow, IsUnicode, FlatFileType, HeaderRowsToSkip) VALUES (2, N'Winnets Data', N'XYZAB', N'CRLF', N'1252', 1, 0, N'Delimited', 0)
SET IDENTITY_INSERT Metadata.MappingFile OFF;


SET IDENTITY_INSERT Metadata.MappingColumn ON
INSERT INTO Metadata.MappingColumn (ColumnId, FileId, SourceColumn, ColumnDelimiter, TargetTable, TargetColumn, TargetDataType, FieldLength, FieldScale, IsPivot, PivotTarget, isAttribute, AttributeTypeId, ColumnNumber) VALUES (1, 1, N'Customer No', N'Comma', N'Customer', N'Customerdentifier', N'String', 30, NULL, 0, NULL, 0, NULL, 0)
INSERT INTO Metadata.MappingColumn (ColumnId, FileId, SourceColumn, ColumnDelimiter, TargetTable, TargetColumn, TargetDataType, FieldLength, FieldScale, IsPivot, PivotTarget, isAttribute, AttributeTypeId, ColumnNumber) VALUES (2, 1, N'End Date', N'Comma', N'Customer', N'ExpiryDate', N'Date', NULL, NULL, 0, NULL, 0, NULL, 1)
INSERT INTO Metadata.MappingColumn (ColumnId, FileId, SourceColumn, ColumnDelimiter, TargetTable, TargetColumn, TargetDataType, FieldLength, FieldScale, IsPivot, PivotTarget, isAttribute, AttributeTypeId, ColumnNumber) VALUES (5, 1, N'Title', N'Comma', N'Customer', N'Title', N'String', 20, NULL, 0, NULL, 0, NULL, 2)
INSERT INTO Metadata.MappingColumn (ColumnId, FileId, SourceColumn, ColumnDelimiter, TargetTable, TargetColumn, TargetDataType, FieldLength, FieldScale, IsPivot, PivotTarget, isAttribute, AttributeTypeId, ColumnNumber) VALUES (6, 1, N'First Name', N'Comma', N'Customer', N'FirstName', N'String', 50, NULL, 0, NULL, 0, NULL, 3)
INSERT INTO Metadata.MappingColumn (ColumnId, FileId, SourceColumn, ColumnDelimiter, TargetTable, TargetColumn, TargetDataType, FieldLength, FieldScale, IsPivot, PivotTarget, isAttribute, AttributeTypeId, ColumnNumber) VALUES (7, 1, N'Surname', N'Comma', N'Customer', N'LastName', N'String', 50, NULL, 0, NULL, 0, NULL, 4)
INSERT INTO Metadata.MappingColumn (ColumnId, FileId, SourceColumn, ColumnDelimiter, TargetTable, TargetColumn, TargetDataType, FieldLength, FieldScale, IsPivot, PivotTarget, isAttribute, AttributeTypeId, ColumnNumber) VALUES (8, 1, N'PhoneNumber', N'Comma', N'Phone', N'PhoneNumber', N'String', 20, NULL, 1, N'PhoneNumber', 0, NULL, 5)
INSERT INTO Metadata.MappingColumn (ColumnId, FileId, SourceColumn, ColumnDelimiter, TargetTable, TargetColumn, TargetDataType, FieldLength, FieldScale, IsPivot, PivotTarget, isAttribute, AttributeTypeId, ColumnNumber) VALUES (9, 1, N'Mobile Number', N'Comma', N'Phone', N'Mobile Number', N'String', 20, NULL, 1, N'PhoneNumber', 0, NULL, 6)
INSERT INTO Metadata.MappingColumn (ColumnId, FileId, SourceColumn, ColumnDelimiter, TargetTable, TargetColumn, TargetDataType, FieldLength, FieldScale, IsPivot, PivotTarget, isAttribute, AttributeTypeId, ColumnNumber) VALUES (10, 1, N'Banker Name', N'Comma', N'Attribute', N'Banker', N'String', 256, NULL, 0, NULL, 1, 1, 7)
INSERT INTO Metadata.MappingColumn (ColumnId, FileId, SourceColumn, ColumnDelimiter, TargetTable, TargetColumn, TargetDataType, FieldLength, FieldScale, IsPivot, PivotTarget, isAttribute, AttributeTypeId, ColumnNumber) VALUES (11, 1, N'Banker Phone', N'Comma', N'Attribute', N'BankerPhone', N'String', 255, NULL, 0, NULL, 1, 1, 8)
INSERT INTO Metadata.MappingColumn (ColumnId, FileId, SourceColumn, ColumnDelimiter, TargetTable, TargetColumn, TargetDataType, FieldLength, FieldScale, IsPivot, PivotTarget, isAttribute, AttributeTypeId, ColumnNumber) VALUES (12, 2, N'CardNumber', N'Comma', N'Customer', N'Customerdentifier', N'String', 30, NULL, 0, NULL, 0, 1, 0)
INSERT INTO Metadata.MappingColumn (ColumnId, FileId, SourceColumn, ColumnDelimiter, TargetTable, TargetColumn, TargetDataType, FieldLength, FieldScale, IsPivot, PivotTarget, isAttribute, AttributeTypeId, ColumnNumber) VALUES (13, 2, N'ExpiryDate', N'Comma', N'Customer', N'ExpiryDate', N'Date', NULL, NULL, 0, NULL, 0, NULL, 1)
INSERT INTO Metadata.MappingColumn (ColumnId, FileId, SourceColumn, ColumnDelimiter, TargetTable, TargetColumn, TargetDataType, FieldLength, FieldScale, IsPivot, PivotTarget, isAttribute, AttributeTypeId, ColumnNumber) VALUES (14, 2, N'Title', N'Comma', N'Customer', N'Title', N'String', 30, NULL, 0, NULL, 0, NULL, 2)
INSERT INTO Metadata.MappingColumn (ColumnId, FileId, SourceColumn, ColumnDelimiter, TargetTable, TargetColumn, TargetDataType, FieldLength, FieldScale, IsPivot, PivotTarget, isAttribute, AttributeTypeId, ColumnNumber) VALUES (15, 2, N'FirstName', N'Comma', N'Customer', N'FirstName', N'String', 50, NULL, 0, NULL, 0, NULL, 3)
INSERT INTO Metadata.MappingColumn (ColumnId, FileId, SourceColumn, ColumnDelimiter, TargetTable, TargetColumn, TargetDataType, FieldLength, FieldScale, IsPivot, PivotTarget, isAttribute, AttributeTypeId, ColumnNumber) VALUES (16, 2, N'LastName', N'Comma', N'Customer', N'LastName', N'String', 50, NULL, 0, NULL, 0, NULL, 4)
INSERT INTO Metadata.MappingColumn (ColumnId, FileId, SourceColumn, ColumnDelimiter, TargetTable, TargetColumn, TargetDataType, FieldLength, FieldScale, IsPivot, PivotTarget, isAttribute, AttributeTypeId, ColumnNumber) VALUES (17, 2, N'City', N'Comma', N'Address', N'City', N'String', 50, NULL, 0, NULL, 0, NULL, 5)
INSERT INTO Metadata.MappingColumn (ColumnId, FileId, SourceColumn, ColumnDelimiter, TargetTable, TargetColumn, TargetDataType, FieldLength, FieldScale, IsPivot, PivotTarget, isAttribute, AttributeTypeId, ColumnNumber) VALUES (18, 2, N'Personal Email', N'Comma', N'Email', N'Personal Email', N'String', 254, NULL, 1, N'EmailAddress', 0, NULL, 6)
INSERT INTO Metadata.MappingColumn (ColumnId, FileId, SourceColumn, ColumnDelimiter, TargetTable, TargetColumn, TargetDataType, FieldLength, FieldScale, IsPivot, PivotTarget, isAttribute, AttributeTypeId, ColumnNumber) VALUES (19, 2, N'BusinessEmail', N'Comma', N'Email', N'BusinessEmail', N'String', 254, NULL, 1, N'EmailAddress', 0, NULL, 7)
INSERT INTO Metadata.MappingColumn (ColumnId, FileId, SourceColumn, ColumnDelimiter, TargetTable, TargetColumn, TargetDataType, FieldLength, FieldScale, IsPivot, PivotTarget, isAttribute, AttributeTypeId, ColumnNumber) VALUES (20, 2, N'Private Banker Phone', N'Comma', N'Attribute', N'LanguageSpoken', N'String', 256, NULL, 0, NULL, 1, 2, 8)
INSERT INTO Metadata.MappingColumn (ColumnId, FileId, SourceColumn, ColumnDelimiter, TargetTable, TargetColumn, TargetDataType, FieldLength, FieldScale, IsPivot, PivotTarget, isAttribute, AttributeTypeId, ColumnNumber) VALUES (1012, 2, N'Address Line 1', N'Comma', N'Address', N'Address1', N'String', 100, NULL, 0, NULL, 0, NULL, 9)
INSERT INTO Metadata.MappingColumn (ColumnId, FileId, SourceColumn, ColumnDelimiter, TargetTable, TargetColumn, TargetDataType, FieldLength, FieldScale, IsPivot, PivotTarget, isAttribute, AttributeTypeId, ColumnNumber) VALUES (1013, 1, N'Email', N'Comma', N'Email', N'Email', N'String', 150, NULL, 1, N'EmailAddress', 0, NULL, 10)
SET IDENTITY_INSERT Metadata.MappingColumn OFF


