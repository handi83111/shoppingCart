IF NOT EXISTS
(
    SELECT *
    FROM sys.tables
    WHERE name = N'skm_order_ship'
)
    BEGIN
        CREATE TABLE [dbo].[skm_order_ship](
	[ship_no] [char](12) NOT NULL,
	[delivery_type] [int] NOT NULL,
	[skm_pay_order_id] [int] NOT NULL,
	[status] [int] NOT NULL,
	[delivery_no] [nvarchar](100) NULL,
	[delivery_response_no] [nvarchar](100) NULL,
	[shipping_date] [datetime] NULL,
	[create_date] [datetime] NOT NULL,
	[modify_id] [nvarchar](30) NULL,
	[modify_date] [datetime] NULL,
        );
END;
GO

--create PK
IF NOT EXISTS
(
    SELECT *
    FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
    WHERE constraint_name = 'PK_skm_order_ship'
)
    BEGIN
        ALTER TABLE [dbo].[skm_order_ship]
        ADD CONSTRAINT [PK_skm_order_ship] PRIMARY KEY(ship_no);
END;
GO