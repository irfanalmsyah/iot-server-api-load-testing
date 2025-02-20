import mqtt from 'k6/x/mqtt';

const url = [`${__ENV.HOST}:1883`];
const topic = 'channel';
const authUsername = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJub2RlX2lkIjo0LCJleHAiOjE3Njc3Nzk2OTd9.2wA_lwrF_6YIDq2RAx7bQoedcMc-7bAx3A9b5AWmG9o';

const message = {
    value: [3.21, 3.14, 8.39, 9.12, 3.94, 13.23, 183.2, 192.3, 72.3, 93.2]
};

const messageString = JSON.stringify(message);
const clientID = `client-${__VU}`;
const client = new mqtt.Client(url, authUsername, '', false, clientID, 2000);
try {
    client.connect()
} catch (error) {
    console.log("connect error", error)
}

export default function () {
    try {
        client.publish(topic, 0, messageString, false, 2000);
    } catch (e) {
        console.error('Publish error:', e);
    }
}

export function handleSummary(data) {
    return {
        stdout: `${data.metrics.iterations.values.rate}\n`,
    };
}

export function teardown() {
    client.close(2000);
}