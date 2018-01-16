for table in stage_charge stage_merchant_app_charge stage_merchant_plan_charge ; do
    mysql -uroot -ptest -e"update test_billing.$table set promoted_time = NULL"
    mysql -uroot -ptest -e"update test_billing.$table set promoted_id = NULL"
done

mysql -uroot -ptest -e"update test_billing.stage_app_metered_event set promoted_time = NULL"
