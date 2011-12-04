---
title: Error handling
layout: default
---

# Error handling

Errors are notified via HTTP response status. Error code are following
the standarad HTTP error code syntax. If there are something bad in
your request, you will get `4xx`. If there are something wrong
happen on the server, you will get `5xx`.

The response body contains JSON object which represents the detail of the error.

# Status code

We define two status code, where the meaning is shared between all requests.

401 (Unauthorized)
: The request does not contains valid authentication token for your application.

402 (Payment required)
: The account's subscriptions are all expired.

# JSON body example

<pre>
[
  {
    resource: "https://ubiregi.com/api/3/menus/1",
    errors: {
      "*": ["permission denied"],
    }
  }
]
</pre>

<pre>
[
  {
    resource: "https://ubiregi.com/api/3/menus/items/134",
    errors: {
      name: ["can't be blank"],
      price: ["should be a number"],
    }
  },
]
</pre>
