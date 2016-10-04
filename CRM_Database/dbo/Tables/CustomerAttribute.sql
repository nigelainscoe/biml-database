CREATE TABLE CustomerAttribute
(
      /* Processing Control Data */
      AttributeId INT IDENTITY NOT NULL
    , MembershipIdentifier NVARCHAR(30) NOT NULL
	, AttributeTypeID SMALLINT
	, AttributeValue NVARCHAR(256)
    , CONSTRAINT PK_CustomerAttribute PRIMARY KEY CLUSTERED ( AttributeId )
    );


