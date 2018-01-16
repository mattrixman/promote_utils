#!/usr/bin/env bash

# first run 
# mysql_config_editor set --login-path=local --host=localhost --user=username --password
# to store the password

db=test_meta

for table in app_metered_event merchant_app_charge merchant_plan_charge app_charge charge_history infolease_charge_attempt charge; do
    mysql --login-path=local -e"delete from $db.$table"
done
