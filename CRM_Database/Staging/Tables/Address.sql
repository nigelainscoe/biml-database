CREATE TABLE [Staging].[Address]
    (
      [StagingAddressId] INT IDENTITY NOT NULL
                             PRIMARY KEY
    , ClientFileId INT NOT NULL
    , FileRowNumber INT NOT NULL
    , [Address1] NVARCHAR(100) NULL
    , [Address2] NVARCHAR(100) NULL
    , [City] NVARCHAR(50) NULL, 
    [Country] NVARCHAR(50) NULL
    );

GO
