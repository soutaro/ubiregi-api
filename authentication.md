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

There are no standard mechanisms to give your application account's API token.
Your application would ask your users to copy-and-paste API token from ubiregi.com web site.