#!/usr/bin/env bash

# first run 
# mysql_config_editor set --login-path=local --host=localhost --user=username --password
# to store the password

db="test_meta"
table="charge"
columns="id, uuid, type, amount, tax, developer_portion, created_time, modified_time"
echo $db.$table
mysql --login-path=local -uroot -e"select $columns from $db.$table"
echo

table="merchant_app_charge"
columns="charge_id, app_subscription_id, created_time, modified_time"
echo $db.$table
mysql --login-path=local -uroot -e"select $columns from $db.$table"
echo

table="merchant_plan_charge"
columns="charge_id, merchant_id, merchant_plan_id, plan_charge_type"
echo $db.$table
mysql --login-path=local -uroot -e"select $columns from $db.$table"
echo

table="app_metered_event"
columns="charge_id, app_metered_id"
echo $db.$table
mysql --login-path=local -uroot -e"select $columns from $db.$table"
echo
