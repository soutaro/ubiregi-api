---
title: Authentication
layout: default
---

# Authentication

Currently we give very simple token based authentication mechanism.
Each account has a secret token which can be used for API access.

We are working to provide standardized mechanisms such as OAuth to simplify authentication for users.

# Authentication

Just give HTTP request header on all requests named `X-Ubiregi-API-Token` which contains users API token.

Users will find the API token for your application, after they installed your application.
Then, the user will give you the information for authentication, the API token.
The API token is installation specific.
If your user uninstall your application, the token will be lost.
After your user re-install your application, new token will be generated.
