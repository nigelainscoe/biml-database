CREATE TABLE [Metadata].[AttributeCategory]
    (
      [CategoryId] TINYINT IDENTITY
                       NOT NULL
                       
    , CategoryName NVARCHAR(100) NOT NULL
	, [IsDemographic] BIT NOT NULL DEFAULT 0, 
    [IsSensitive] BIT NOT NULL DEFAULT 0, 
    CONSTRAINT PK_AttributeCategory PRIMARY KEY CLUSTERED (CategoryId)
    );
