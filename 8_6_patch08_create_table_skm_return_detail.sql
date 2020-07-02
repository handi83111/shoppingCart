IF NOT EXISTS
(
    SELECT *
    FROM sys.tables
    WHERE name = N'skm_return_detail'
)
    BEGIN
        CREATE TABLE [dbo].[skm_return_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[return_form_id] [int] NOT NULL,
	[trust_id] [uniqueidentifier] NOT NULL,
	[shop_code] [varchar](4) NOT NULL,
	[brand_counter_code] [nvarchar](100) NULL,
	[external_deal_guid] [uniqueidentifier] NOT NULL,
	[bid] [uniqueidentifier] NOT NULL,
	[delivery_product_code] [nvarchar](50) NULL,
	[item_name] [nvarchar](200) NOT NULL,
	[sku_name] [nvarchar](200) NULL,
	[refund_quantity] [int] NOT NULL,
	[item_unit_price] [int] NOT NULL,
	[total] [int] NULL,
	[item_unit_burning_point] [int] NULL,
	[burning_point_total] [int] NULL,
	[product_gift_certificate] [int] NOT NULL DEFAULT (0),
	[freebie_gift_certificate] [int] NOT NULL DEFAULT (0),
	[gift_certificate_balance] [int] NOT NULL DEFAULT (0),
	[product_gift_certificate_balance] [int] NOT NULL DEFAULT (0),
	[sell_gift_certificate] [int] NOT NULL DEFAULT (0),
	[sell_product_gift_certificate] [int] NOT NULL DEFAULT (0),
	[cash_coupon] [int] NOT NULL DEFAULT (0),
	[skm_discount_amount] [int] NOT NULL DEFAULT (0),
	[skm_discount_point] [int] NOT NULL DEFAULT (0),
	[reason_id] [int] NOT NULL,
	[memo] [nvarchar](500) NULL,
	[delivery_response_no] [nvarchar](100) NULL,
	[delivery_del_no] [nvarchar](100) NULL,
	[status] [int] NOT NULL,
	[reply] [nvarchar](500) NULL,
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
    WHERE constraint_name = 'PK_skm_return_detail'
)
    BEGIN
        ALTER TABLE [dbo].[skm_return_detail]
        ADD CONSTRAINT [PK_skm_return_detail] PRIMARY KEY(id);
END;
GO