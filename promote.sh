#!/usr/bin/env bash
COOKIE=$( \
    curl -i -s -S http://127.0.0.1:8950/billing/v1/login -X POST \
    -H "Content-Type: application/json" \
    -H 'Accept: application/json, text/javascript, */*; q=0.01' \
    -H 'Connection: keep-alive' -d '{"username":"test.user","password":"any_pass_will_do"}' \
    | grep set-cookie \
    | awk '{$1=""; print $0}')

curl http://localhost:8950/billing/v1/route/monthly/V9DK8QQF125J0/promote -X PUT \
    -H "Content-Type: application/json" \
    -H 'Accept: application/json, text/javascript, */*; q=0.01' \
    --cookie "$COOKIE"
