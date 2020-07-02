IF NOT EXISTS
(
    SELECT *
    FROM sys.tables
    WHERE name = N'skm_shopping_cart'
)
    BEGIN
        CREATE TABLE [dbo].[skm_shopping_cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_payment_id] [int] NOT NULL,
	[shop_code] [varchar](4) NOT NULL,
	[is_delivery] [bit] NOT NULL DEFAULT ((0))
        );
END;
GO

--create PK
IF NOT EXISTS
(
    SELECT *
    FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
    WHERE constraint_name = 'PK_skm_shopping_cart'
)
    BEGIN
        ALTER TABLE [dbo].[skm_shopping_cart]
        ADD CONSTRAINT [PK_skm_shopping_cart] PRIMARY KEY(id);
END;
GO