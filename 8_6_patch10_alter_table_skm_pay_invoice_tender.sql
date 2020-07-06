IF NOT EXISTS
(
    SELECT *
    FROM sys.columns
    WHERE Name IN(N'sell_order_no_s')
    AND Object_ID = OBJECT_ID(N'skm_pay_invoice_tender_detail')
)
    BEGIN
        ALTER TABLE [dbo].[skm_pay_invoice_tender_detail]
        ADD [sell_order_no_s] varchar(50) null 
END;