# Google credentials / Identifiants Google

- Français : ce document
- English: [GOOGLE_AUTH.en.md](GOOGLE_AUTH.en.md)

## Google Search Console

Créer un compte de service Google Cloud, générer une clé JSON, puis l’enregistrer sous :

- [Créer un compte de service](https://console.cloud.google.com/iam-admin/serviceaccounts/create)
- [Gérer les comptes de service](https://console.cloud.google.com/iam-admin/serviceaccounts)
- [Créer une clé JSON](https://console.cloud.google.com/iam-admin/serviceaccounts)

```text
%USERPROFILE%\\.codex\\secrets\\google\\gsc-service-account.json
```

Ajouter le `client_email` du compte de service comme utilisateur dans Google Search Console :

- [Utilisateurs et autorisations Search Console](https://search.google.com/search-console/users)
- [Aide officielle : gérer les utilisateurs](https://support.google.com/webmasters/answer/7687615)

## Google Analytics 4

Activer :

- [Google Analytics Data API](https://console.cloud.google.com/apis/library/analyticsdata.googleapis.com)
- [Google Analytics Admin API](https://console.cloud.google.com/apis/library/analyticsadmin.googleapis.com)

Créer les identifiants OAuth et télécharger le JSON depuis :

- [Créer un client OAuth](https://console.cloud.google.com/apis/credentials/oauthclient)
- [Gérer les identifiants Google Cloud](https://console.cloud.google.com/apis/credentials)
- [Accéder à Google Analytics](https://analytics.google.com/analytics/)

```text
%USERPROFILE%\\.codex\\secrets\\google\\ga4-credentials.json
```

Renseigner `GOOGLE_PROJECT_ID` dans la configuration MCP du plugin avant d’utiliser GA4.

## CrUX

Activer l’API Chrome UX Report. Pour utiliser une clé API avec quota, créer une clé ici :

- [Activer l’API Chrome UX Report](https://console.cloud.google.com/apis/library/chromeuxreport.googleapis.com)
- [Créer une clé API](https://console.cloud.google.com/apis/credentials)

```powershell
$env:CRUX_API_KEY = "your-api-key"
```

The CrUX helper can also use public unauthenticated calls when quota allows it.
