const endpoint = "https://chromeuxreport.googleapis.com/v1/records:queryRecord";

const origin = process.argv[2];
if (!origin) {
  console.error("Usage: node scripts/crux-query.mjs https://example.com");
  process.exit(1);
}

const apiKey = process.env.CRUX_API_KEY;
const url = apiKey ? `${endpoint}?key=${encodeURIComponent(apiKey)}` : endpoint;

const response = await fetch(url, {
  method: "POST",
  headers: {
    "content-type": "application/json"
  },
  body: JSON.stringify({
    origin,
    formFactor: "PHONE"
  })
});

const body = await response.text();
if (!response.ok) {
  console.error(body);
  process.exit(1);
}

console.log(JSON.stringify(JSON.parse(body), null, 2));
