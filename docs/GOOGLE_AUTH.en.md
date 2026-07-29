# Google credentials

- English: this document
- Français : [GOOGLE_AUTH.md](GOOGLE_AUTH.md)

## Google Search Console

Create a Google Cloud service account and download a JSON key:

- [Create a service account](https://console.cloud.google.com/iam-admin/serviceaccounts/create)
- [Manage service accounts](https://console.cloud.google.com/iam-admin/serviceaccounts)

Save the file as:

```text
%USERPROFILE%\\.codex\\secrets\\google\\gsc-service-account.json
```

Add the service account `client_email` to the property:

- [Search Console users and permissions](https://search.google.com/search-console/users)
- [Official help: manage users](https://support.google.com/webmasters/answer/7687615)

## Google Analytics 4

Enable the APIs:

- [Google Analytics Data API](https://console.cloud.google.com/apis/library/analyticsdata.googleapis.com)
- [Google Analytics Admin API](https://console.cloud.google.com/apis/library/analyticsadmin.googleapis.com)

Create and download the OAuth JSON:

- [Create an OAuth client](https://console.cloud.google.com/apis/credentials/oauthclient)
- [Manage Google Cloud credentials](https://console.cloud.google.com/apis/credentials)
- [Open Google Analytics](https://analytics.google.com/analytics/)

Save it as:

```text
%USERPROFILE%\\.codex\\secrets\\google\\ga4-credentials.json
```

Set `GOOGLE_PROJECT_ID` in the plugin MCP configuration before using GA4.

## CrUX

Enable the Chrome UX Report API and optionally create an API key:

- [Enable Chrome UX Report API](https://console.cloud.google.com/apis/library/chromeuxreport.googleapis.com)
- [Create or manage an API key](https://console.cloud.google.com/apis/credentials)

The CrUX helper also supports public unauthenticated calls when quota allows it.
