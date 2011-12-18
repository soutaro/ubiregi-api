---
title: Authentication
layout: default
tab: authentication
---

# Authentication

Currently we provide very simple token based authentication mechanism.
Every installations of client have their own secret tokens which can be used for API access.

## Installation

A user will *install* apps to ubiregi.com.
Installations generate new secret tokens.
The user have to notify an app its secret token, and the app will be authenticated with the token.

* User need to *install* an app to use it
* Each installation have their own secret token
* There are no automated way to notify app its secret token  
  (We are planning to provide standardized mechanisms such as OAuth.)

User may *uninstall* an app.
Un-installation of an app will invalidate the secret token.
After your app got uninstalled by the user, your app can not access the user's data.

The secret token is installation specific.
If your user uninstall your application, the token will be invalidated.
After your user re-install your application, new token will be generated.

## Authorization

There is only one authorizatioin levels, **everything**.
If a user allows an app to access its data (installs the app), the app can access everything.

# The protocol

Give HTTP request header on all requests named `X-Ubiregi-API-Token` which contains users secret token, and your request will be authorized.

If the token is invalid one, your request will result in `401` (Unauthorized) status.

Note that there are another possibility to make your request failed.
`402` (Payment required) may be returned in the case the user's subscription got expired.
After the user renew the subscription, the status will be recovered.

