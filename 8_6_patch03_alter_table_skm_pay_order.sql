IF NOT EXISTS
(
    SELECT *
    FROM sys.columns
    WHERE Name IN(N'shopping_cart_id')
    AND Object_ID = OBJECT_ID(N'skm_pay_order')
)
    BEGIN
        ALTER TABLE [dbo].[skm_pay_order]
        ADD [shopping_cart_id] [int] NULL;
END;
GO