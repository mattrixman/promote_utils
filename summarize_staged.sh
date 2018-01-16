#!/usr/bin/env bash

# first run 
# mysql_config_editor set --login-path=local --host=localhost --user=username --password
# to store the password

db="test_billing"
table="stage_charge"
read -a result <<< $(mysql --login-path=local -uroot -e"select sum(amount), count(*) from $db.$table where promoted_time is NULL and promoted_id is NULL;"| tail -n 1)
total_charge=${result[0]}
charge_ct=${result[1]}
echo -n "$charge_ct charges, totaling $"
echo $total_charge | sed 's/..$/.&/'

charge_table="stage_charge"
map_table="stage_merchant_app_charge"
read -a result <<< $(mysql --login-path=local -uroot -e"SELECT sum(sc.amount), count(*) from $db.$charge_table as sc JOIN $db.$map_table as map ON sc.id = map.charge_id WHERE sc.promoted_time is NULL and sc.promoted_id is NULL;"| tail -n 1)
map_charge=${result[0]}
map_ct=${result[1]}
echo -n "$map_ct merchant app charges, totaling $"
echo $map_charge | sed 's/..$/.&/'
