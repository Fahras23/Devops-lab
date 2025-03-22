import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  // A number specifying the number of VUs to run concurrently.
  vus: 10,
  // loop iterations
  iterations: 10 ,
  // A string specifying the total duration of the test run.
  duration: '10s',
};

export default function() {
  http.get(`http://${__ENV.HOSTNAME}/`);
  sleep(1);
}
