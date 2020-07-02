IF NOT EXISTS
(
    SELECT *
    FROM sys.tables
    WHERE name = N'skm_order_payment'
)
    BEGIN
        CREATE TABLE [dbo].[skm_order_payment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[payment_no] [char](15) NOT NULL,
	[payment_method] [int] NOT NULL,
	[payment_amount] [int] NOT NULL,
	[credit_card] [int] NOT NULL DEFAULT ((0)),
	[install_period] [int] NOT NULL DEFAULT ((0)),
	[install_down_pay] [int] NOT NULL DEFAULT ((0)),
	[install_each_pay] [int] NOT NULL DEFAULT ((0)),
	[install_fee] [int] NOT NULL DEFAULT ((0)),
	[card_hash] [varchar](50) NOT NULL DEFAULT (''),
	[cash] [int] NOT NULL DEFAULT ((0)),
	[burning_skm_point] [int] NOT NULL DEFAULT ((0)),
	[redeem_amount] [int] NOT NULL DEFAULT ((0)),
	[redeem_point] [int] NOT NULL DEFAULT ((0)),
	[gift_certificate] [int] NOT NULL DEFAULT ((0)),
	[cash_coupon] [int] NOT NULL DEFAULT ((0)),
	[user_id] [int] NOT NULL,
	[pre_trans_no] [varchar](36) NULL,
	[payment_token] [varchar](36) NULL,
	[skm_trade_no] [varchar](30) NULL,
	[create_date] [datetime] NOT NULL
        );
END;
GO

--create PK
IF NOT EXISTS
(
    SELECT *
    FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
    WHERE constraint_name = 'PK_skm_order_payment'
)
    BEGIN
        ALTER TABLE [dbo].[skm_order_payment]
        ADD CONSTRAINT [PK_skm_order_payment] PRIMARY KEY(payment_no);
END;
GO