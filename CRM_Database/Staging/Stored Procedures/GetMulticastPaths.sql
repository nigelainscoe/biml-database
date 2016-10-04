CREATE PROCEDURE [Staging].[GetMulticastPaths] @FileId INT
AS

    SELECT DISTINCT
            'Table' AS MulticastType
          , TargetTable AS MulticastPath
          , NULL AS AttributeTypeId
    FROM    Metadata.MappingColumn
    WHERE   isAttribute = 0
            AND FileId = @FileId
    UNION ALL
    SELECT DISTINCT
            'Attribute' AS MulticastType
          , TargetColumn AS MulticastPath
          , AttributeTypeId
    FROM    Metadata.MappingColumn
    WHERE   isAttribute = 1
            AND FileId = @FileId;

    RETURN 0;
