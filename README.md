# RLM Logistics

### Notes

- what is up with the inconsistency of the data format for sales_order?
  - fields are not all caps and some are underscored while others are camel-cased

- for sales order why are the following fields all required?
  - :order_date
  - :start_date
  - :cancel_date

- for address why is state required?
  - what about orders from countries where state is not required?

- for address why is zip required?
  - what about orders from countries where zip is not required? i.e. Ireland

### Usage

```
# instantiate client
client = RlmLogistics::Client.new(username: "testuser", key: "123testkey")

# get inventory
client.Inventory.all

# instantiate a new order object
order = client.Order.new

# save object sends API request if valid, otherwise returns errors
order.save
```
