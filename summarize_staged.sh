#!/usr/bin/env bash

# first run 
# mysql_config_editor set --login-path=local --host=localhost --user=username --password
# to store the password

monthly_route_id=$1

dollars() {
    echo "ifnull(sum($1), '000')"
}

db="test_billing"
table="stage_charge"
read -a result <<< $(mysql --login-path=local -uroot -e"select $(dollars amount), count(*), $(dollars developer_portion), $(dollars tax) from $db.$table where request_uuid = '$monthly_route_id'"| tail -n 1)
total_charge=${result[0]}
charge_ct=${result[1]}
dev_portion=${result[2]}
taxes=${result[3]}
echo -n "$charge_ct charges, totaling $"
echo $total_charge | sed 's/..$/.&/'
echo -n "\$$dev_portion" | sed 's/..$/.&/'
echo " of which is due to developers"
echo -n "\$$taxes" | sed 's/..$/.&/'
echo " of which is taxes"

charge_table="stage_charge"
mac_table="stage_merchant_app_charge"
read -a result <<< $(mysql --login-path=local -uroot -e"SELECT $(dollars sc.amount), count(*) from $db.$charge_table as sc JOIN $db.$mac_table as mac ON sc.id = mac.charge_id"| tail -n 1)
mac_charge=${result[0]}
mac_ct=${result[1]}
echo -n "$mac_ct merchant app charges, totaling $"
echo $mac_charge | sed 's/..$/.&/'

charge_table="stage_charge"
mpc_table="stage_merchant_plan_charge"
read -a result <<< $(mysql --login-path=local -uroot -e"SELECT $(dollars sc.amount), count(*) from $db.$charge_table as sc JOIN $db.$mpc_table as mpc ON sc.id = mpc.charge_id"| tail -n 1)
mpc_charge=${result[0]}
mpc_ct=${result[1]}
echo -n "$mpc_ct plan charges, totaling $"
echo $mpc_charge | sed 's/..$/.&/'

charge_table="stage_charge"
ame_table="stage_app_metered_event"
read -a result <<< $(mysql --login-path=local -uroot -e"SELECT $(dollars sc.amount), count(*) from $db.$charge_table as sc JOIN $db.$ame_table as ame ON sc.id = ame.stage_charge_id"| tail -n 1)
ame_charge=${result[0]}
ame_ct=${result[1]}
echo -n "$ame_ct metered event charges, totaling $"
echo $ame_charge | sed 's/..$/.&/'
