/*
	Procedure:		Logging.StagingStarted

	Purpose:		Create a log record to record the starting time of a new file being staged

	Notes:			None

	Parameters:		@FileName - The full path of the file being logged
					@FileId - The PK of the newly created log record (returned to the caller)
	
	Date Created:	09/06/2016
	Created By:		Nigel Ainscoe

*/
CREATE PROCEDURE Logging.StagingStarted
    @FileName NVARCHAR(256) 
  , @FileId INT OUTPUT
AS
    BEGIN TRY

        INSERT  INTO Logging.ClientFileProcessing
                ( FileName, StagingStarted )
        VALUES  ( @FileName, SYSDATETIME() );

		SET @FileId = SCOPE_IDENTITY();

    END TRY

    BEGIN CATCH

        THROW;
    END CATCH;


	
	
	

