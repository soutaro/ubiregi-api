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

Visit your app's install URL.

<img src="images/app_installation.png" width="100%">

You can install/uninstall the app to your account.
Visit [https://ubiregi.com/installs] to list all applications you have installed.

## Authorization

There is only one authorizatioin levels, **everything**.
If a user allows an app to access its data (installs the app), the app can access everything.

# The protocol

Give HTTP the following two request headers on all requests.

<table>
<tr>
<th width="190"><code>X-Ubiregi-Auth-Token</code></th>
<td>
Users secret token to identify user and installation.
This is used for authentication.
Both of you and users are responsible to keep it secret.
</td>
</tr>
<tr>
<th><code>X-Ubiregi-App-Secret</code></th>
<td>
To identify your app.
This can be used to block the app.
You are responsible to keep it secret.
</td>
</tr>
</table>

If `X-Ubiregi-Auth-Token` is invalid, your request will result in `401` (Unauthorized) status.

Note that there are another possibility to make your request failed.
`402` (Payment required) may be returned in the case the user's subscription got expired.
After the user renew the subscription, the status will be recovered.

Check the [example app](ubiregi-api-client-example.rb) to see how the authentication is exactly.
