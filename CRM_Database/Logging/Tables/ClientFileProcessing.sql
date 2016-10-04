CREATE TABLE Logging.ClientFileProcessing
    (
      ClientFileId INT IDENTITY
                       NOT NULL
    , FileName NVARCHAR(256) NOT NULL
    , StagingStarted DATETIME2(0)
    , RowsStagedCount INT
    , StagingCompleted DATETIME2(0)
    , ProductionLoadStarted DATETIME2(0)
    , RowsLoadedCount INT
    , RowsRejectedCount INT
    , ProductionLoadCompleted DATETIME2(0)
    , CONSTRAINT PK_ClientFileProcessing PRIMARY KEY CLUSTERED
        ( ClientFileId )
    );
