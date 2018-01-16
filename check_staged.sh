#!/usr/bin/env bash

# first run 
# mysql_config_editor set --login-path=local --host=localhost --user=username --password
# to store the password


db="test_billing"
table="stage_charge"
columns="id, uuid, type, amount, tax, developer_portion, promoted_time, promoted_id, request_uuid"
echo $db.$table
mysql --login-path=local -uroot -e"select $columns from test_billing.$table"
echo

table="stage_merchant_app_charge"
columns="charge_id, merchant_id, app_subscription_id, promoted_time, promoted_id, request_uuid"
echo $db.$table
mysql --login-path=local -uroot -e"select $columns from test_billing.$table"
echo

table="stage_merchant_plan_charge"
columns="charge_id, merchant_id, merchant_plan_id, plan_charge_type, promoted_time, promoted_id, request_uuid"
echo $db.$table
mysql --login-path=local -uroot -e"select $columns from test_billing.$table"
echo

table="stage_app_metered_event"
columns="stage_charge_id, app_metered_event_id, merchant_id, promoted_time, request_uuid"
echo $db.$table
mysql --login-path=local -uroot -e"select $columns from test_billing.$table"
echo
