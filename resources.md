---
title: Resources
layout: default
---

# Object definitions

# Resources

## GET /account

### Summary

Description
:    Retrieves information about the account.

URL Structure
:    `https://ubiregi.com/api/3/account`

### Parameters

There are no parameters.

### Sample Response

<pre>
{
  id: 123,
  name: "Ubiregi",
  username: "ubiregi",
  email: "info@ubiregi.com",
  menus: [1],
  stocks: [1],
}
</pre>

### Return value definitions

<table>
	<tr>
		<th>id</th>
		<td>ID of the user</td>
	</tr>
	<tr>
		<th>name</th>
		<td>The name of the account</td>
	</tr>
</table>

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
