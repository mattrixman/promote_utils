
#!/usr/bin/env bash

# first run 
# mysql_config_editor set --login-path=local --host=localhost --user=username --password
# to store the password

db=test_billing

for table in stage_merchant_app_charge stage_merchant_plan_charge stage_charge; do
    mysql --login-path=local -e"delete from $db.$table"
done

mysql --login-path=local -e"delete from test_billing.stage_app_metered_event"
