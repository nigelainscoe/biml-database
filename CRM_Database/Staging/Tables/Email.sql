CREATE TABLE [Staging].[Email]
    (
      [EmailId] INT IDENTITY
                    NOT NULL
                    PRIMARY KEY
    , ClientFileId INT NOT NULL
    , FileRowNumber INT NULL
    , [EmailAddress] NVARCHAR(254) NULL
    );
