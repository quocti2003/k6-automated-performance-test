import http from 'k6/http';
import { check, sleep } from 'k6';

// __ENV la object chua tat ca environment variables
// Neu khong co env thi dung gia tri mac dinh (de chay local duoc)
const BASE_URL = __ENV.K6_BASE_URL || 'http://localhost:8082';
const USERNAME = __ENV.K6_USERNAME || 'tile';
const PASSWORD = __ENV.K6_PASSWORD || 'TiMirror$123';

export let options = {
  vus: 5,
  duration: '30s',
};

// setup() chay DUY NHAT 1 LAN truoc khi test bat dau
// Ket qua return se duoc truyen vao default function va teardown
export function setup() {
  const loginRes = http.post(
    `${BASE_URL}/api/v1/auth/authenticate`,
    JSON.stringify({
      username: USERNAME,
      password: PASSWORD,
    }),
    { headers: { 'Content-Type': 'application/json' } }
  );

  console.log(`Login response status: ${loginRes.status}`);
  console.log(`Login response body: ${loginRes.body}`);

  check(loginRes, {
    'login status 200': (r) => r.status === 200,
  });

  if (loginRes.status !== 200) {
    throw new Error(`Login failed: ${loginRes.body}`);
  }

  const token = loginRes.json().accessToken;
  console.log(`Login OK, token: ${token.substring(0, 30)}...`);
  return { token };    // return data nay se truyen vao ham default function ben duoi
}

// Ham nay duoc MOI VU goi lap di lap lai trong suot duration
// data = ket qua tu setup() o tren
export default function (data) {
  const res = http.get(`${BASE_URL}/api/v1/users/me`, {
    headers: { Authorization: `Bearer ${data.token}` },
  });

  check(res, {
    'status is 200': (r) => r.status === 200,
    'response time < 500ms': (r) => r.timings.duration < 500,
    'has username': (r) => r.json().username === USERNAME,
  });

  sleep(1);
}

export function teardown() {
  console.log('\nLoad test ket thuc!');
}
