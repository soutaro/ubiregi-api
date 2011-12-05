---
title: Resources
layout: default
---

# Objects

## Account

<pre>
{
    token: 3q489y3bq94oghrnontv48,
    login: "ubiregi-cafe",
    email: "cafe@ubiregi.com",
    name: "Ubiregi Cafe",
    subscription_expire_at: "2011-11-13T00:00:00Z",
    subscription_kind: "premium",
    menus: [ 8 ],
    stocks: [ 100 ],
    tables: [ $tables ],
    customer_tags: [ $customer_tags ],
    cashiers: [ $cashiers ],
}
</pre>

## Table

<pre>
{
    id: 123,
    name: "Table 1",
    position: 3,
}
</pre>

## Customer Tag

<pre>
{
    id: 123,
    name: "Dating",
    potision: 13,
    icon: ::base64EncodedIcon,
}
</pre>

## Cashier

<pre>
{
    id: 385,
    name: "Soutaro Matsumoto",
    icon: ::base64EncodedIcon,
}
</pre>

## Menu Item

# Account

## GET /account

### Summary

Retrieves information about the account.

### Response

An `Account` object.
<pre>
{
    account: $account,
    timestamp: "2011-11-02T09:11:34Z",
}
</pre>

### Parameters

<table>
<tr>
<th>until (optional)</th>
<td>
    Timestamp used to make tables, customer_tags, and cashiers contains only updated ones.
    Encouraged to include this parameter if the access is not the first one nor explicitly want to reload everything.
</td>
</tr>
</table>

### Note

Accesses to `/account` do not expire.
Even if your account is expired, it returns your account's information.
However menus, stocks, tables, customer_tags, and cashiers will be empty in that case.

# Menu

## GET /menus/:id/items

### Summary

Description
:   Retrieves list of menu items.

URL Structure
:   `https://ubiregi.com/api/3/menus/:id/items`

### Parameters

The parameters should be given as URL parameters.

    /menus/0/items?since=2011-12-01T12:34:11Z&until=2011-12-02T12:11:15Z&glb=1023

<table>
	<tr>
		<th>since (optional)</th>
		<td>Time in ISO 8601 format. The timezone should be UTC. Inclusive.</td>
	</tr>
	<tr>
		<th>until (optional)</th>
		<td>Time in ISO 8601 format. the timezone must be UTC. Exclusive.</td>
	</tr>
	<tr>
		<th>glb (optional)</th>
		<td>Greates lower bound of id of menu item.</td>
	</tr>
</table>

### Sample Response

<pre>
{
  timestamp: "2011-11-23T00:01:11Z",
  next-url: "https://ubiregi.com/api/3/menus/30/items?since=2011-12-01T12:34:11Z&amp;until=2011-11-23T00:01:11Z&amp;glb=123",
  items: [
    _item_,
    _item_,
    ...
  ]
}
</pre>

### Return value definitions

timestamp
:   Time the request is processed on server.
    This would be used for next time to send the request.

next_url (optional)
:   URLs to send GET request to complete the refresh.
	null in the case there are no more item to refresh.

items
:   Array of updated items since `since` parameter.

## POST /menus/:id/items

### Summary

Description
:   Add new menu item.

URL Structure
:   `https://ubiregi.com/api/3/menus/:id/items`

#### Remarks

A creation and update of new items is transactional, i.e. all items will be created successfully, or all items will be rejected.

## GET /menus/:id/categories

## POST /menus/:id/categories

## POST /menus/categories/:id/delete

### Summary

Description
:   Delete the category.

URL Structure
:   `https://ubiregi.com/api/3/menus/categories/:id/delete`

### Parameters

No parameter can be given.

### Remarks

All menu items associated with the category will be updated.
Reloading items required.

### Sample Response

<pre>
{}
</pre>

## GET /menus/:id/tags

## GET /tags

## POST /tags

## GET /checkouts

## POST /checkouts

## GET /customers

## POST /customers

## GET /customers/:id/notes

## POST /customers/:id/notes

## GET /stocks

## GET /stocks/:id/

## GET /stocks/items/:id/events

## POST /stocks/items/:id/events

