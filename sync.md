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

