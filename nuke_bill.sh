for table in stage_merchant_app_charge stage_merchant_plan_charge stage_charge; do
    mysql -uroot -ptest -e"delete from test_billing.$table"
done

mysql -uroot -ptest -e"delete from test_billing.stage_app_metered_event"
