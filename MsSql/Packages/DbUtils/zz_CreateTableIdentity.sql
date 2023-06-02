-- =============================================
-- Author:		Mohsen Mirshahreza
-- Create date: 2023-06-02
-- Description:	Create a table with a Identity column
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[zz_CreateTableIdentity]
	@TableName VARCHAR(128), @PkFieldName VARCHAR(64) = 'Id', @PkFieldType VARCHAR(32) = 'INT',@PkIdentityStart INT=1,@PkIdentityStep INT=1
AS

BEGIN

	DECLARE @S NVARCHAR(4000) = '
CREATE TABLE [dbo].['+@TableName+'](
	['+@PkFieldName+'] ['+@PkFieldType+'] IDENTITY('+CAST(@PkIdentityStart AS VARCHAR)+','+CAST(@PkIdentityStep AS VARCHAR)+') NOT NULL,
 CONSTRAINT [PK_'+@TableName+'_'+@PkFieldName+'] PRIMARY KEY CLUSTERED 
(
	['+@PkFieldName+'] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]	
	';

	EXECUTE SP_EXECUTESQL @S;
END