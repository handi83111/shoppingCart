IF NOT EXISTS
(
    SELECT *
    FROM sys.tables
    WHERE name = N'skm_return_reason'
)
    BEGIN
        CREATE TABLE [dbo].[skm_return_reason]
        ([id]            [INT] IDENTITY(1, 1) NOT NULL, 
         [reason]        [NVARCHAR](30) NOT NULL, 
         [is_show]       [BIT] NOT NULL DEFAULT((1)), 
         [memo_required] [BIT] NOT NULL DEFAULT((0)), 
         [sort]          [INT] NOT NULL, 
         [create_id]     [NVARCHAR](30) NOT NULL, 
         [create_date]   [DATETIME] NOT NULL, 
         [modify_id]     [NVARCHAR](30) NULL, 
         [modify_date]   [DATETIME] NULL
        );
END;
GO

--create PK
IF NOT EXISTS
(
    SELECT *
    FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
    WHERE constraint_name = 'PK_skm_return_reason'
)
    BEGIN
        ALTER TABLE [dbo].[skm_return_reason]
        ADD CONSTRAINT [PK_skm_return_reason] PRIMARY KEY(id);
END;
GO


IF EXISTS
(
    SELECT *
    FROM sys.tables
    WHERE name = N'skm_return_reason'
)
    BEGIN
        INSERT INTO [dbo].[skm_return_reason]
        ([reason], 
         [sort], 
         [create_id], 
         [create_date]
        )
        VALUES
        (N'商品不符合預期', 
         1, 
         'system', 
         GETDATE()
        );

        INSERT INTO [dbo].[skm_return_reason]
        ([reason], 
         [sort], 
         [create_id], 
         [create_date]
        )
        VALUES
        (N'商品瑕疵或破損-請說明', 
         2, 
         'system', 
         GETDATE()
        );

        INSERT INTO [dbo].[skm_return_reason]
        ([reason], 
         [sort], 
         [create_id], 
         [create_date]
        )
        VALUES
        (N'商品寄送有誤', 
         3, 
         'system', 
         GETDATE()
        );

        INSERT INTO [dbo].[skm_return_reason]
        ([reason], 
		 [memo_required],
         [sort], 
         [create_id], 
         [create_date]
        )
        VALUES
        (N'其他原因-請說明', 
		 1,
         4, 
         'system', 
         GETDATE()
        );
END;
GO