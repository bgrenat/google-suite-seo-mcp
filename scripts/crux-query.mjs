const endpoint = "https://chromeuxreport.googleapis.com/v1/records:queryRecord";

const origin = process.argv[2];
if (!origin) {
  console.error("Usage: node scripts/crux-query.mjs https://example.com");
  process.exit(1);
}

// CRUX_API_KEY is sent only to Google's official CrUX endpoint above, never elsewhere.
const apiKey = process.env.CRUX_API_KEY;
const headers = { "content-type": "application/json" };
if (apiKey) {
  headers["X-goog-api-key"] = apiKey;
}

const response = await fetch(endpoint, {
  method: "POST",
  headers,
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
