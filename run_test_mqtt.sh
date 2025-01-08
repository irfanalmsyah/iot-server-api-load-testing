#!/bin/bash
echo "Starting tests at $(date '+%Y-%m-%d %H:%M:%S')"

SLEEP_TIME=2m
RUN_COUNT=5

run_test() {
    local VUS=$1

    for ((i=1; i<=RUN_COUNT; i++)); do
        echo "Running test ($i/$RUN_COUNT): with $VUS concurrent users"
        ./k6 run rust_mqtt.js --vus $VUS --duration 60s --quiet
        echo "Finished test ($i/$RUN_COUNT): with $VUS concurrent users"
        echo "Sleeping for $SLEEP_TIME"
        sleep $SLEEP_TIME
    done
}

run_test 200
run_test 400
run_test 600
run_test 800
run_test 1000

echo "Finished tests at $(date '+%Y-%m-%d %H:%M:%S')"
