# Google credentials / Identifiants Google

- Français : ce document
- English: [GOOGLE_AUTH.en.md](GOOGLE_AUTH.en.md)

## Google Search Console

### API et scopes : distinction importante

Le MCP GSC de ce dépôt utilise un **compte de service**, pas un consentement OAuth utilisateur. Vous ne verrez donc pas forcément un scope Search Console dans **Google Auth Platform → Data Access** pour cette partie.

Activez d'abord la [Search Console API](https://console.cloud.google.com/apis/library/searchconsole.googleapis.com), puis ajoutez l'adresse `client_email` du compte de service dans Search Console.

Pour un flux OAuth utilisateur, les scopes Search Console sont :

```text
https://www.googleapis.com/auth/webmasters.readonly
https://www.googleapis.com/auth/webmasters
```

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

### GA4 OAuth scope

Dans **Google Auth Platform → Data Access**, ajoutez :

```text
https://www.googleapis.com/auth/analytics.readonly
```

Recherchez l'URI complète après avoir activé les APIs GA4. Le fichier OAuth doit être un JSON lisible sans BOM UTF-8.

## CrUX

Activer l’API Chrome UX Report. Pour utiliser une clé API avec quota, créer une clé ici :

- [Activer l’API Chrome UX Report](https://console.cloud.google.com/apis/library/chromeuxreport.googleapis.com)
- [Créer une clé API](https://console.cloud.google.com/apis/credentials)

```powershell
$env:CRUX_API_KEY = "your-api-key"
```

The CrUX helper can also use public unauthenticated calls when quota allows it.
