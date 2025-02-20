import http from "k6/http";
import { getTokenUser } from "./token_go.js";

export const options = {
  duration: "60s",
};

export function setup() {
  functionalTest();
  return { token: getTokenUser() };
}

const HOST = `http://${__ENV.HOST}`;
const PORT = "3000";

const node_payload = {
  name: "test",
  location: "test",
  id_hardware_node: 1,
  id_hardware_sensor: [3, 4, 4, 17, 8, 7, 3, 4, 5, 7],
  field_sensor: ["sensor1", "sensor2", "sensor3", "sensor4", "sensor5", "sensor6", "sensor7", "sensor8", "sensor9", "sensor10"],
  is_public: true
}

const node_payload_update = {
  name: "test",
  location: "test",
  id_hardware_node: 1,
  id_hardware_sensor: [3, 4, 4, 17, 8, 7, 3, 4, 5, 7],
  field_sensor: ["sensor1", "sensor2", "sensor3", "sensor4", "sensor5", "sensor6", "sensor7", "sensor8", "sensor9", "sensor10"],
  is_public: 1
}

const channel_payload = {
  value: [3.21, 3.14, 8.39, 9.12, 3.94, 13.23, 183.2, 192.3, 72.3, 93.2],
  id_node: 4
}

export default function (data) {
  let url = `${HOST}:${PORT}${__ENV.ENDPOINT}`;
  let params = {
    headers: {
      Authorization: `Bearer ${data.token}`,
      "Content-Type": "application/json",
    },
  };
  switch (__ENV.METHOD) {
    case "GET":
      http.get(url, params);
      break;
    case "POST":
      switch (__ENV.ENDPOINT) {
        case "/node":
          http.post(url, JSON.stringify(node_payload), params);
          break;
        case "/channel":
          http.post(url, JSON.stringify(channel_payload), params);
          break;
        default:
          throw new Error("Unsupported endpoint");
      }
      break;
    case "PUT":
      http.put(url, JSON.stringify(node_payload_update), params);
      break;
    case "DELETE":
      http.del(url, null, params);
      break;
    default:
      throw new Error("Unsupported method");
  }
}

export function handleSummary(data) {
  return {
    stdout: `${data.metrics.http_reqs.values.rate}\n`,
  };
}

const functionalTest = () => {
  const token = getTokenUser();
  let url = `${HOST}:${PORT}${__ENV.ENDPOINT}`;
  let params = {
    headers: {
      Authorization: `Bearer ${token}`,
      "Content-Type": "application/json",
    },
  };
  let res;
  switch (__ENV.METHOD) {
    case "GET":
      res = http.get(url, params);
      break;
    case "POST":
      switch (__ENV.ENDPOINT) {
        case "/node":
          res = http.post(url, JSON.stringify(node_payload), params);
          break;
        case "/channel":
          res = http.post(url, JSON.stringify(channel_payload), params);
          break;
        default:
          throw new Error("Unsupported endpoint");
      }
      break;
    case "PUT":
      res = http.put(url, JSON.stringify(node_payload_update), params);
      break;
    case "DELETE":
      res = http.del(url, null, params);
      break;
    default:
      throw new Error("Unsupported method");
  }
  if (res.status !== 200 && res.status !== 201) {
    if (__ENV.METHOD === "DELETE" && res.status === 404) {
      return;
    }
    throw new Error(`Functional test failed: ${res.status} - ${res.body}`);
  }
}