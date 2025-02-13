#!/bin/bash

SLEEP_TIME=2m
RUN_COUNT=5

run_test() {
    local VUS=$1
    local METHOD=$2
    local ENDPOINT=$3

    for ((i=1; i<=RUN_COUNT; i++)); do
        echo "Running test ($i/$RUN_COUNT): $METHOD $ENDPOINT with $VUS concurrent users"
        K6_VUS=$VUS k6 run ./go.js --quiet -e METHOD=$METHOD -e ENDPOINT=$ENDPOINT
        echo "Finished test ($i/$RUN_COUNT): $METHOD $ENDPOINT with $VUS concurrent users"
        echo "Sleeping for $SLEEP_TIME"
        sleep $SLEEP_TIME
    done
}

echo "Starting tests at $(date '+%Y-%m-%d %H:%M:%S')"

run_test 200 GET /node
run_test 400 GET /node
run_test 600 GET /node
run_test 800 GET /node
run_test 1000 GET /node

echo "Finished tests at $(date '+%Y-%m-%d %H:%M:%S')"
