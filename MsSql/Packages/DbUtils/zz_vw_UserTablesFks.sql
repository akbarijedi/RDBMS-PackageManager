-- =============================================
-- Author:		Mohsen Mirshahreza
-- Create date: 2023-06-02
-- Description:	Select all Fks for tables
-- =============================================
CREATE OR ALTER VIEW [dbo].[zz_vw_UserTablesFks]
AS

SELECT	[FKs].[NAME] FkName,
		OBJECT_NAME(FKs.PARENT_OBJECT_ID) TableName,
		COL_NAME(FKColumns.PARENT_OBJECT_ID,FKColumns.PARENT_COLUMN_ID) FieldName,
		RefTables.[NAME] TargetTable,RefColumns.[NAME] TargetField,
        ~[FKs].IS_DISABLED EnforceRelation
FROM 
   SYS.FOREIGN_KEYS AS FKs
LEFT OUTER JOIN SYS.FOREIGN_KEY_COLUMNS FKColumns ON FKs.OBJECT_ID = FKColumns.CONSTRAINT_OBJECT_ID
LEFT OUTER JOIN SYS.TABLES RefTables ON RefTables.OBJECT_ID = FKColumns.REFERENCED_OBJECT_ID
LEFT OUTER JOIN SYS.COLUMNS RefColumns ON RefColumns.COLUMN_ID = FKColumns.CONSTRAINT_COLUMN_ID AND RefColumns.OBJECT_ID = FKColumns.REFERENCED_OBJECT_ID
WHERE [FKs].[type]='F' 
LEFT OUTER JOIN SYS.OBJECTS OBJS ON OBJS.OBJECT_ID=C.OBJECT_ID
