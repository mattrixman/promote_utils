#!/usr/bin/env bash

# first run 
# mysql_config_editor set --login-path=local --host=localhost --user=username --password
# to store the password

# promote will update some tables in test_meta
# this command will replace those tables with their values from meta
# (essentially undoing the promote)
mysqldump -uroot -ptest meta app_metered_event charge merchant_app_charge merchant_plan_charge salesforce_config | mysql -uroot -ptest -D test_meta
