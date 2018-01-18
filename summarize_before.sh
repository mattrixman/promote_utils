#!/usr/bin/env bash

# first run 
# mysql_config_editor set --login-path=local --host=localhost --user=username --password
# to store the password

dollars() {
    echo "IFNULL(SUM($1), '0')"
}

db="meta"
table="charge"
mysql --login-path=local -v -e"SELECT $(dollars amount) AS 'Total Charges', COUNT(*) AS 'Number of Charges' FROM $db.$table"

charge_table="charge"
mac_table="merchant_app_charge"
mysql --login-path=local -v -e"SELECT $(dollars sc.amount) AS 'Total Merchant App Charges', count(*) AS 'Number of Merchant App Charges' from $db.$charge_table as sc JOIN $db.$mac_table as mac ON sc.id = mac.charge_id"

mpc_table="merchant_plan_charge"
mysql --login-path=local -v -e"SELECT $(dollars sc.amount) AS 'Total Merchant Plan Charges', count(*) AS 'Number of Merchant Plan Charges' from $db.$charge_table as sc JOIN $db.$mpc_table as mpc ON sc.id = mpc.charge_id"
