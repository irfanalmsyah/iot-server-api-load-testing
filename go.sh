#!/bin/bash

SLEEP_TIME=30
RUN_COUNT=5
IP=10.0.0.7
USERNAME=c001d4ky0898

run_test() {
    local VUS=$1
    local METHOD=$2
    local ENDPOINT=$3

    for ((i=1; i<=RUN_COUNT; i++)); do
        echo "Starting server on instance ($IP)..."
        ssh $USERNAME@$IP "cd /home/$USERNAME/iot-server-athaullah && bash -l ./run.sh"
        echo "Sleep for 10s"
        sleep 10
        echo "Running test ($i/$RUN_COUNT): $METHOD $ENDPOINT with $VUS concurrent users"
        K6_VUS=$VUS k6 run ./script/go.js --quiet -e METHOD=$METHOD -e ENDPOINT=$ENDPOINT -e HOST=$IP
        echo "Killing server on instance B..."
        ssh $USERNAME@$IP "pkill -9 -f server-iot"
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

run_test 200 GET /node/3
run_test 400 GET /node/3
run_test 600 GET /node/3
run_test 800 GET /node/3
run_test 1000 GET /node/3

run_test 200 POST /node
run_test 400 POST /node
run_test 600 POST /node
run_test 800 POST /node
run_test 1000 POST /node

run_test 200 PUT /node/3
run_test 400 PUT /node/3
run_test 600 PUT /node/3
run_test 800 PUT /node/3
run_test 1000 PUT /node/3

run_test 200 DELETE /node/3
run_test 400 DELETE /node/3
run_test 600 DELETE /node/3
run_test 800 DELETE /node/3
run_test 1000 DELETE /node/3

run_test 200 POST /channel
run_test 400 POST /channel
run_test 600 POST /channel
run_test 800 POST /channel
run_test 1000 POST /channel

echo "Finished tests at $(date '+%Y-%m-%d %H:%M:%S')"
