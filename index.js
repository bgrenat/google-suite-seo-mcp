import { definePluginEntry } from "openclaw/plugin-sdk/plugin-entry";

export default definePluginEntry({
  id: "seo-google-suite",
  name: "SEO Google Suite",
  description: "Contributes static Google Search Console, GA4, and CrUX MCP servers.",
  register(_api) {
    // No runtime behavior needed; MCP servers are declared in openclaw.plugin.json.
  },
});
