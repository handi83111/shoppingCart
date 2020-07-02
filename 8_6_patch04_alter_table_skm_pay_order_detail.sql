IF NOT EXISTS
(
    SELECT *
    FROM sys.columns
    WHERE Name IN(N'freight_free_limit')
    AND Object_ID = OBJECT_ID(N'skm_pay_order_detail')
)
    BEGIN
        ALTER TABLE [dbo].[skm_pay_order_detail]
        ADD [freight_free_limit] [int] NULL
END;
GO

IF NOT EXISTS
(
    SELECT *
    FROM sys.columns
    WHERE Name IN(N'freight_event_id')
    AND Object_ID = OBJECT_ID(N'skm_pay_order_detail')
)
    BEGIN
        ALTER TABLE [dbo].[skm_pay_order_detail]
        ADD [freight_event_id] [int] NULL
END;
GO

IF NOT EXISTS
(
    SELECT *
    FROM sys.columns
    WHERE Name IN(N'order_ship_no')
    AND Object_ID = OBJECT_ID(N'skm_pay_order_detail')
)
    BEGIN
        ALTER TABLE [dbo].[skm_pay_order_detail]
        ADD [order_ship_no] [char](12) NULL
END;
GO

IF NOT EXISTS
(
    SELECT *
    FROM sys.columns
    WHERE Name IN(N'delivery_response_no')
    AND Object_ID = OBJECT_ID(N'skm_pay_order_detail')
)
    BEGIN
        ALTER TABLE [dbo].[skm_pay_order_detail]
        ADD [delivery_response_no] [nvarchar](100) NULL
END;
GO

IF NOT EXISTS
(
    SELECT *
    FROM sys.columns
    WHERE Name IN(N'delivery_del_no')
    AND Object_ID = OBJECT_ID(N'skm_pay_order_detail')
)
    BEGIN
        ALTER TABLE [dbo].[skm_pay_order_detail]
        ADD [delivery_del_no] [nvarchar](100) NULL
END;
GO

IF NOT EXISTS
(
    SELECT *
    FROM sys.columns
    WHERE Name IN(N'create_date')
    AND Object_ID = OBJECT_ID(N'skm_pay_order_detail')
)
    BEGIN
        ALTER TABLE [dbo].[skm_pay_order_detail]
        ADD [create_date] [datetime] NULL
END;
GO

IF NOT EXISTS
(
    SELECT *
    FROM sys.columns
    WHERE Name IN(N'modify_date')
    AND Object_ID = OBJECT_ID(N'skm_pay_order_detail')
)
    BEGIN
        ALTER TABLE [dbo].[skm_pay_order_detail]
        ADD [modify_date] [datetime] NULL
END;
GO