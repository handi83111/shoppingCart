IF NOT EXISTS
(
    SELECT *
    FROM sys.tables
    WHERE name = N'skm_delivery'
)
    BEGIN
        CREATE TABLE [dbo].[skm_delivery](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ship_company_id] [int] NOT NULL,
	[delivery_no] [nvarchar](100) NULL,
	[delivery_package_no] [nvarchar](100) NULL,
	[delivery_del_no] [nvarchar](100) NULL,
	[delivery_ship_history] [nvarchar](max) NULL,
	[delivery_ship_type] [int] NOT NULL,
	[delivery_process_type] [nvarchar](10) NOT NULL,
	[delivery_type] [int] NOT NULL,
	[delivery_status] [int] NOT NULL DEFAULT ((0)),
	[delivery_status_code] [nvarchar](10) NULL,
	[delivery_status_modify_time] [datetime] NULL,
	[delivery_shipping_time] [datetime] NULL,
	[delivery_arrival_time] [datetime] NULL,
	[delivery_memo] [nvarchar](max) NULL,
	[create_date] [datetime] NOT NULL,
	[modify_date] [datetime] NULL
        );
END;
GO

--create PK
IF NOT EXISTS
(
    SELECT *
    FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
    WHERE constraint_name = 'PK_skm_delivery'
)
    BEGIN
        ALTER TABLE [dbo].[skm_delivery]
        ADD CONSTRAINT [PK_skm_delivery] PRIMARY KEY(id);
END;
GO