import http from "k6/http";

const getToken = (creds) => {
  const url = `http://${__ENV.HOST}:3000/user/login`;
  const payload = JSON.stringify({
    username: creds,
    password: creds,
  });

  const params = {
    headers: {
      "Content-Type": "application/json",
    },
  };

  const res = http.post(url, payload, params);

  if (res.status === 200) {
    return res.body;
  } else {
    throw new Error(`Failed to fetch token: ${res.status} - ${res.body}`);
  }
};

export const getTokenUser = () => getToken("user");
export const getTokenAdmin = () => getToken("admin");