IF NOT EXISTS
(
    SELECT *
    FROM sys.tables
    WHERE name = N'skm_return_form'
)
    BEGIN
        CREATE TABLE [dbo].[skm_return_form](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[skm_pay_order_id] [int] NOT NULL,
	[refund_method] [int] NULL,
	[refund_amount] [int] NULL,
	[credit_card] [int] NULL,
	[cash] [int] NULL,
	[burning_skm_point] [int] NULL,
	[redeem_amount] [int] NULL,
	[redeem_point] [int] NULL,
	[gift_certificate] [int] NULL,
	[cash_coupon] [int] NULL,
	[skm_return_trade_no] [varchar](30) NULL,
	[progress_status] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[area_code] [varchar](10) NULL,
	[tel] [varchar](10) NULL,
	[phone] [varchar](10) NULL,
	[zip_code] [varchar](10) NULL,
	[city] [nvarchar](10) NULL,
	[district] [nvarchar](10) NULL,
	[street] [nvarchar](100) NULL,
	[remark] [nvarchar](500) NULL,
	[delivery_no] [nvarchar](100) NULL,
	[return_type] [int] NOT NULL,
	[create_id] [nvarchar](30) NOT NULL,
	[create_date] [datetime] NOT NULL,
        [refund_date] [datetime] NOT NULL,
	[modify_id] [nvarchar](30) NULL,
	[modify_date] [datetime] NULL
        );
END;
GO

--create PK
IF NOT EXISTS
(
    SELECT *
    FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
    WHERE constraint_name = 'PK_skm_return_form'
)
    BEGIN
        ALTER TABLE [dbo].[skm_return_form]
        ADD CONSTRAINT [PK_skm_return_form] PRIMARY KEY(id);
END;
GO