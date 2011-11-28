---
title: Things every developer should know
layout: default
---

# Things every developer should know

## Ubiregi web app is build with Rails

We use Ruby on Rails 3 to develop ubiregi.com web app. We carefully
described things non-rails-developer should mention about, but may be
insufficient.

If you have some problem, you may need to check Rails related
documents.

## The API is entirely HTTP-based, and RESTful

Methods to retrieve data from the Ubiregi API requires a GET
request. Methods to create new things requires a POST request. And to
update things requires a PUT request. Most methods requires a
particular HTTP method and will return an error if you do not make your
request with the correct one.

## JSON is used

We use JSON for every structured data. It implies that binary data are
encoded with base64 and non-ascii characters are UTF8 encoded.

## Use HTTPS

All requests to Ubiregi API must be HTTPS requests.