IF EXISTS (SELECT TABLE_NAME 
	   FROM   INFORMATION_SCHEMA.VIEWS 
	   WHERE  TABLE_NAME = N'view_skm_counter_order')
    DROP VIEW view_skm_counter_order
GO

CREATE VIEW view_skm_counter_order
AS 
SELECT DISTINCT 
                            sp.id AS skm_pay_order_id, cd.shop_code, cd.counter_code, sp.order_no, iv.sell_invoice, sp.create_date, ed.title, 
                            ct.status, di.id AS delivery_info_id, ss.store_guid, ct.trust_id, di.name, di.phone, di.address, 
                            ed.Guid AS external_guid, ed.create_id
FROM              dbo.skm_pay_order AS sp WITH (nolock) INNER JOIN
                            dbo.skm_counter_deal AS cd WITH (nolock) ON sp.main_bid = cd.bid INNER JOIN
                            dbo.skm_shoppe AS ss WITH (nolock) ON cd.shop_code = ss.shop_code AND 
                            cd.counter_code = ss.brand_counter_code INNER JOIN
                            dbo.skm_pay_invoice AS iv WITH (nolock) ON sp.id = iv.skm_pay_order_id AND iv.sell_transtype = 1 AND 
                            iv.pre_sales_status = 1 INNER JOIN
                            dbo.external_deal AS ed WITH (nolock) ON cd.external_guid = ed.Guid INNER JOIN
                            dbo.cash_trust_log AS ct WITH (nolock) ON sp.order_guid = ct.order_guid LEFT OUTER JOIN
                            dbo.skm_pay_order_delivery_info AS di WITH (nolock) ON sp.id = di.skm_pay_order_id
WHERE          (sp.status IN (50, 70)) AND (ed.delivery_type <> 2) --排除統倉訂單
GO