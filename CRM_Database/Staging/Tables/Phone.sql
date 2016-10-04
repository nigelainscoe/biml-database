CREATE TABLE [Staging].[Phone]
    (
      [PhoneId] INT IDENTITY NOT NULL
                             PRIMARY KEY
    , ClientFileId INT NOT NULL
    , FileRowNumber INT NOT NULL
    , [PhoneNumber] NVARCHAR(100)  NULL
    , [FixOrMobile] NVARCHAR(50) NULL
    );
