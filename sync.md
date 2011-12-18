---
title: Synchronization
layout: default
tab: sync
---

# Synchronization Guide

Ubiregi assumes the clients caches API data.
The API design is designed to be suitable for the purpose.
The synchronization strategy is described in this guide.

Following this guide helps your apps work well with synchronization mechanism.

## Synchronization matters

The internet connection may be unavailable; the ISP may crash, iPad cell-phone service may be unavailable.
ubiregi.com server may be down.
However, shops can not stop their cash register operation.

Even if the access to ubiregi.com server is unavailable, Ubiregi must continue shop operation.

### Operations available under internet unreachable condition

* Register new checkout
* Printing receipt
* Reviewing customers history
* Calculate stocks
* Share stock information

### Operations available only under internet reachable condition

* Updating menus
* Updating to the latest stock information

## Synchronization Strategy

> The API client stores most information in its strage.

To reduce the data transmission, API provides some parameters.

Most API to retrieve (possibily) big data take the three parameters -- `since`, `until`, and `glb` -- and returns `timestamp` field.

The `since` parameter should be the easiest one to understand.
If an object is updated after `since`, the object will be sent.
To make sure that the ubiregi.com clock and client clock are synchronized, we send `timestamp` field.

Once you received an API response, next request should contain `since` which is the same one with `timestamp` included in the last requst.

The problem is when there are so many changes since your last request.
ubiregi.com server should send large data, and it blocks for a while.

This is very bad thing, so it split the response into chanks.
Now, you may understand how `glb` is used.
Objects in a response is sorted, usually by its DB id.
`glb` stands for Greatest Lower Bounds.

Still it is problematic.
