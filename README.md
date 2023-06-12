# Tea Subscriptions

Tea Subscriptions is an internal api that allows consumers to create tea subscriptions for customers with different tea options. 
<br>

### Endpoints
<br>

### 1. Create a Subscription

<br>

*Note:* pass `price`, `active`, `customer_id`, & `tea_id` in request body. `active` is a boolean value

```bash 
POST '/api/v1/subscriptions'
```

Response
```bash
{
    "data": {
        "id": "ID",
        "type": "subscription",
        "attributes": {
            "active": "ACTIVE_STATUS",
            "tea_id": "TEA_ID",
            "customer_id": "CUSTOMER_ID"
        }
    }
}
```

<br>

### 2. Cancel a Subscription

<br>

*Note:* pass `"active": false` in request body. `active` is a boolean value

```bash 
Patch '/api/v1/subscriptions/{subscription_id}'
```

Response
```bash
{
    "data": {
        "id": "ID",
        "type": "subscription",
        "attributes": {
            "active": "ACTIVE_STATUS",
            "tea_id": "TEA_ID",
            "customer_id": "CUSTOMER_ID"
        }
    }
}
```

<br>

### 3. Retrieve all of a customer's subscriptions (active or canceled)

<br>

```bash 
GET '/api/v1/customers/{customer_id}/subscriptions'
```

Response
```bash
{
    "data": [
        {
            "id": "ID",
            "type": "subscription",
            "attributes": {
                "active": "ACTIVE_STATUS",
                "tea_id": "TEA_ID",
                "customer_id": "CUSTOMER_ID"
            }
        }
    ]
}
```