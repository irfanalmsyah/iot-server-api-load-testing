#!/bin/bash

SLEEP_TIME=2m
RUN_COUNT=5

run_test() {
    local VUS=$1
    local METHOD=$2
    local ENDPOINT=$3

    for ((i=1; i<=RUN_COUNT; i++)); do
        echo "Running test ($i/$RUN_COUNT): $METHOD $ENDPOINT with $VUS concurrent users"
        K6_VUS=$VUS k6 run ./rust.js --quiet -e METHOD=$METHOD -e ENDPOINT=$ENDPOINT
        echo "Finished test ($i/$RUN_COUNT): $METHOD $ENDPOINT with $VUS concurrent users"
        echo "Sleeping for $SLEEP_TIME"
        sleep $SLEEP_TIME
    done
}

echo "Starting tests at $(date '+%Y-%m-%d %H:%M:%S')"

run_test 200 GET /nodes/
run_test 400 GET /nodes/
run_test 600 GET /nodes/
run_test 800 GET /nodes/
run_test 1000 GET /nodes/

run_test 200 GET /nodes/3/
run_test 400 GET /nodes/3/
run_test 600 GET /nodes/3/
run_test 800 GET /nodes/3/
run_test 1000 GET /nodes/3/

run_test 200 POST /nodes/
run_test 400 POST /nodes/
run_test 600 POST /nodes/
run_test 800 POST /nodes/
run_test 1000 POST /nodes/

run_test 200 PUT /nodes/3/
run_test 400 PUT /nodes/3/
run_test 600 PUT /nodes/3/
run_test 800 PUT /nodes/3/
run_test 1000 PUT /nodes/3/

run_test 200 DELETE /nodes/3/
run_test 400 DELETE /nodes/3/
run_test 600 DELETE /nodes/3/
run_test 800 DELETE /nodes/3/
run_test 1000 DELETE /nodes/3/

run_test 200 POST /channel/
run_test 400 POST /channel/
run_test 600 POST /channel/
run_test 800 POST /channel/
run_test 1000 POST /channel/

echo "Finished tests at $(date '+%Y-%m-%d %H:%M:%S')"
