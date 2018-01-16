REPLACE INTO stage_charge 
(uuid, amount, status_owner, type, system_type, request_uuid) 
VALUES ('AAAAAAAAAAAAA', 500, 'BBBBBBBBBBBBB', 'SUBSCRIPTION', 'INFOLEASE', 'CCCCCCCCCCCCC');

REPLACE INTO stage_merchant_app_charge
(merchant_app_id, app_subscription_id, charge_id, modified_time, merchant_id, request_uuid)
SELECT 101, 102, id, NOW(), 103, 'CCCCCCCCCCCCC'
FROM stage_charge WHERE uuid='AAAAAAAAAAAAA';
