---
title: Welcome
layout: default
---

<h1 style="font-size:70pt; text-align:center; font-family:Times; margin:50px 0; line-height:100%">Ubiregi API</h1>

<h3 style="text-align:center; margin-bottom:50px">Ubiregi is simple and clean yet poweful; so the API is.</h3>

Ubiregi API allows third parties to develop systems which interact
with Ubiregi data, including menus, tags, customers, and checkouts.

Using Ubiregi API, you can develop your own application for:

* Editing menus with your <s>legacy</s> excellent system
* Importing sales data into your <s>legacy</s> great system
* Advanced sales analysis
* Advanced stock control
* Booking

and, such features essential for your or your clients' business.

Ubiregi API provides almost full access to Ubiregi's data. Everything
except authentication is the same with what the Ubiregi app is doing.
(In fact, the API v3 is essentialy more powerful than API v2, which is
used until Ubiregi2 2.6.)

## Five Steps to Developp Your App

1. Signup to ubiregi.com
2. Register for developer account and new application
3. Install the application on your account
4. Download the sample app
5. Change the sample app, and it is your app now!

## General Notes <small>Things every developer should know</small>

### The API is entirely HTTP-based, and RESTful

Methods to retrieve data from the Ubiregi API requires a GET
request. Methods to create new things requires a POST request. And to
update things requires a PUT request. Most methods requires a
particular HTTP method and will return an error if you do not make your
request with the correct one.

### Ubiregi web app is build with Rails

We use Ruby on Rails 3 to develop ubiregi.com web app. We carefully
described things non-rails-developer should mention about, but may be
insufficient.

If you have some problem, you may need to check Rails related
documents.

### JSON is used

We use JSON for every structured data. It implies that binary data are
encoded with base64 and non-ascii characters are UTF8 encoded.

### Use HTTPS

All requests to Ubiregi API must be HTTPS requests.
