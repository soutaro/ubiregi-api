---
title: Registration
layout: default
---

# Registration

Developers who want to develop an application should register their applications.
The registration form will open soon.

## Account

Developer account can be used for testing developer's applications.

Accounts marked as developers' do not expire.
However, the Ubiregi application can not be used to register checkouts on the account.
This limitation is to prevent someone to use developer account for their daily usage.

We provide a sample application which retrieves the account information and create random checkouts.
The application can be used to make sample data.

We are checking all developer accounts if they are used for daily usage.
If we found a suspicious account, we will send an email and ask to explain how the account is used.
And, if there are no enough explaination, we may stop the account.

## Application

To access Ubiregi API using your application, you should register your application.

Name
: The name of your application to be displayed for your user.

ID
: Unique identifier for your application.
  We recommend to give name in Java package name manner; inverse your domain, like `com.ubiregi.sampleapp`.

Description
: Short description of your application.

URL (Optional)
: The URL of your application. 

Note (Optional)
: Any notes on your application.

After our review process, your application will be registered on ubiregi.com server.
Registered applications have its own URL to allow your users to install the application.

Install URL
: `https://ubiregi.com/apps/3948yasdkgh`

The last part of the URL is random string, so that the URL can not be infereed. 
Unless you tell your users the URL, the URL can not visit the URL.
