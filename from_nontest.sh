#!/usr/bin/env bash

# first run 
# mysql_config_editor set --login-path=local --host=localhost --user=username --password
# to store the password

# then load the baseline data into meta

#mysqldump --login-path=local meta charge infolease_charge_attempt charge_history app_charge merchant_plan_charge merchant_app_charge app_metered_event > prodDump.sql
#sed -i 's/meta/test_meta' prodDump.sql
~/Repo/server/db/migrate setup --test --password test --force

mysqldump --verbose --login-path=local test_meta  < prodDump.sql
