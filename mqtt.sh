#!/bin/bash

SLEEP_TIME=30
RUN_COUNT=5
IP=10.0.0.7
USERNAME=c001d4ky0898

run_test() {
    local VUS=$1

    for ((i=1; i<=RUN_COUNT; i++)); do
        echo "Starting server on instance ($IP)..."
        ssh $USERNAME@$IP "cd /home/$USERNAME/iot-server-api && bash -l ./run.sh"
        echo "Sleep for 10s"
        sleep 10
        echo "Running test ($i/$RUN_COUNT): with $VUS concurrent users"
        ./k6 run ./script/rust_mqtt.js --vus $VUS --duration 60s --quiet -e HOST=$IP
        echo "Killing server on instance B..."
        ssh $USERNAME@$IP "pkill -9 -f iot-server-api"
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
