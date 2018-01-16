db=test_meta

for table in app_metered_event merchant_app_charge merchant_plan_charge app_charge charge_history infolease_charge_attempt charge; do
    mysql -uroot -ptest -e"delete from $db.$table"
done
