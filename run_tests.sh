#!/bin/bash

SLEEP_TIME=10

echo "GET /nodes/ 200 concurrent users"
K6_VUS=200 k6 run ./rust.js --quiet -e METHOD=GET -e ENDPOINT=/nodes/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "GET /nodes/ 400 concurrent users"
K6_VUS=400 k6 run ./rust.js --quiet -e METHOD=GET -e ENDPOINT=/nodes/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "GET /nodes/ 600 concurrent users"
K6_VUS=600 k6 run ./rust.js --quiet -e METHOD=GET -e ENDPOINT=/nodes/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "GET /nodes/ 800 concurrent users"
K6_VUS=800 k6 run ./rust.js --quiet -e METHOD=GET -e ENDPOINT=/nodes/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "GET /nodes/ 1000 concurrent users"
K6_VUS=1000 k6 run ./rust.js --quiet -e METHOD=GET -e ENDPOINT=/nodes/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "GET /nodes/3/ 200 concurrent users"
K6_VUS=200 k6 run ./rust.js --quiet -e METHOD=GET -e ENDPOINT=/nodes/3/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "GET /nodes/3/ 400 concurrent users"
K6_VUS=400 k6 run ./rust.js --quiet -e METHOD=GET -e ENDPOINT=/nodes/3/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "GET /nodes/3/ 600 concurrent users"
K6_VUS=600 k6 run ./rust.js --quiet -e METHOD=GET -e ENDPOINT=/nodes/3/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "GET /nodes/3/ 800 concurrent users"
K6_VUS=800 k6 run ./rust.js --quiet -e METHOD=GET -e ENDPOINT=/nodes/3/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "GET /nodes/3/ 1000 concurrent users"
K6_VUS=1000 k6 run ./rust.js --quiet -e METHOD=GET -e ENDPOINT=/nodes/3/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "POST /nodes/ 200 concurrent users"
K6_VUS=200 k6 run ./rust.js --quiet -e METHOD=POST -e ENDPOINT=/nodes/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "POST /nodes/ 400 concurrent users"
K6_VUS=400 k6 run ./rust.js --quiet -e METHOD=POST -e ENDPOINT=/nodes/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "POST /nodes/ 600 concurrent users"
K6_VUS=600 k6 run ./rust.js --quiet -e METHOD=POST -e ENDPOINT=/nodes/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "POST /nodes/ 800 concurrent users"
K6_VUS=800 k6 run ./rust.js --quiet -e METHOD=POST -e ENDPOINT=/nodes/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "POST /nodes/ 1000 concurrent users"
K6_VUS=1000 k6 run ./rust.js --quiet -e METHOD=POST -e ENDPOINT=/nodes/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "PUT /nodes/3/ 200 concurrent users"
K6_VUS=200 k6 run ./rust.js --quiet -e METHOD=PUT -e ENDPOINT=/nodes/3/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "PUT /nodes/3/ 400 concurrent users"
K6_VUS=400 k6 run ./rust.js --quiet -e METHOD=PUT -e ENDPOINT=/nodes/3/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "PUT /nodes/3/ 600 concurrent users"
K6_VUS=600 k6 run ./rust.js --quiet -e METHOD=PUT -e ENDPOINT=/nodes/3/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "PUT /nodes/3/ 800 concurrent users"
K6_VUS=800 k6 run ./rust.js --quiet -e METHOD=PUT -e ENDPOINT=/nodes/3/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "PUT /nodes/3/ 1000 concurrent users"
K6_VUS=1000 k6 run ./rust.js --quiet -e METHOD=PUT -e ENDPOINT=/nodes/3/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "DELETE /nodes/3/ 200 concurrent users"
K6_VUS=200 k6 run ./rust.js --quiet -e METHOD=DELETE -e ENDPOINT=/nodes/3/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "DELETE /nodes/3/ 400 concurrent users"
K6_VUS=400 k6 run ./rust.js --quiet -e METHOD=DELETE -e ENDPOINT=/nodes/3/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "DELETE /nodes/3/ 600 concurrent users"
K6_VUS=600 k6 run ./rust.js --quiet -e METHOD=DELETE -e ENDPOINT=/nodes/3/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "DELETE /nodes/3/ 800 concurrent users"
K6_VUS=800 k6 run ./rust.js --quiet -e METHOD=DELETE -e ENDPOINT=/nodes/3/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "DELETE /nodes/3/ 1000 concurrent users"
K6_VUS=1000 k6 run ./rust.js --quiet -e METHOD=DELETE -e ENDPOINT=/nodes/3/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "POST /channel/ 200 concurrent users"
K6_VUS=200 k6 run ./rust.js --quiet -e METHOD=POST -e ENDPOINT=/channel/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "POST /channel/ 400 concurrent users"
K6_VUS=400 k6 run ./rust.js --quiet -e METHOD=POST -e ENDPOINT=/channel/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "POST /channel/ 600 concurrent users"
K6_VUS=600 k6 run ./rust.js --quiet -e METHOD=POST -e ENDPOINT=/channel/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "POST /channel/ 800 concurrent users"
K6_VUS=800 k6 run ./rust.js --quiet -e METHOD=POST -e ENDPOINT=/channel/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME

echo "POST /channel/ 1000 concurrent users"
K6_VUS=1000 k6 run ./rust.js --quiet -e METHOD=POST -e ENDPOINT=/channel/
echo "sleeping for 2 minutes"
sleep $SLEEP_TIME