# RLM Logistics

[![Build Status](https://travis-ci.org/jGRUBBS/rlm_logistics.svg?branch=master)](https://travis-ci.org/jGRUBBS/rlm_logistics)

This is a Ruby library for interfacing with the [RLM](http://www2.ronlynn.com/) API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rlm_logistics'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rlm_logistics

### Usage

`config/inializer/rlm.rb`

```ruby
RlmLogistics.config do |r|
  r.username      = "XXUSER"
  r.password      = "XXKEY"
  r.endpoint_path = "TESTServices"
  r.company       = 90
end
```

**inventory**

[RLM documentation](http://sellect-dev.s3.amazonaws.com/documentation/rlm/RLM-inventory-retrieval.pdf)

```ruby
inventories = RlmLogistics::Record::Inventory.where(
  retrieve_upcs:    'Y',
  division_number:  10,
  ats_includes_wip: 'N'
)
# =>
# [
#    <RlmLogistics::Record::Inventory...>,
#    <RlmLogistics::Record::Inventory...>,
#    <RlmLogistics::Record::Inventory...>
# ]
```

**sales order**

[RLM documentation](http://sellect-dev.s3.amazonaws.com/documentation/rlm/RLM-sales_order-entry.pdf)

```ruby
shipping_address = {
  name:         "My Name",
  address1:     "ad1",
  address2:     "ad2",
  city:         "My city",
  state:        "NY",
  zip:          "My zip",
  country_code: "USA",
  address_type: "S"
}

billing_address = {
  name:         "My Name",
  address1:     "ad10",
  city:         "My city",
  state:        "NY",
  zip:          "My zip",
  address_type: "B"
}

line_items = [
  {
    sku_number: 4,
    style:      "CB11D10",
    color:      "BLUE",
    size:       "S",
    price:      10.99,
    quantity:   1
  }
]

sales_order = RlmLogistics::Record::SalesOrder.new(
  division_number: 50,
  email:           "customer@gmail.com",
  currency:        "$",
  order_date:      20120115,
  start_date:      20120115,
  cancel_date:     20120115,
  customer_po:     "YOURPO#",
  special01:       101,
  special02:       102,
  special03:       103,
  special04:       104,
  discount:        0.05,
  warehouse:       1,
  addresses: [
    shipping_address,
    billing_address
  ],
  details: line_items
)

sales_order.save
```

If order submitted(saved) successfully the `sales_order` will have an `id` that relates to RLM's order id.

**credits**

[RLM documentation](http://sellect-dev.s3.amazonaws.com/documentation/rlm/RLM-credits.pdf)

```ruby
credit = RlmLogistics::Record::Credit.new(
  date_from: 20130131,
  date_to:   20130601
)

credit.save
credit.parsed_data
# =>
# [
#    <RlmLogistics::Record::Credit...>,
#    <RlmLogistics::Record::Credit...>,
#    <RlmLogistics::Record::Credit...>
# ]
```

**items**

[RLM documentation](http://sellect-dev.s3.amazonaws.com/documentation/rlm/RLM-items.pdf)

```ruby
items = RlmLogistics::Record::Item.where(
  division_number: 10,
  retrieve_upcs:   "Y"
)
# =>
# [
#    <RlmLogistics::Record::Item...>,
#    <RlmLogistics::Record::Item...>,
#    <RlmLogistics::Record::Item...>
# ]
```

**packed orders**

[RLM documentation](http://sellect-dev.s3.amazonaws.com/documentation/rlm/RLM-packed_order.pdf)

```ruby
packed_order = RlmLogistics::Record::PackedOrder.all
# =>
# [
#    <RlmLogistics::Record::PackedOrder...>,
#    <RlmLogistics::Record::PackedOrder...>,
#    <RlmLogistics::Record::PackedOrder...>
# ]
```

**error handling**

Validation and errors are handled by ActiveModel so error handling looks like this:

```ruby
sales_order.errors.full_messages
# => ["The user/key combination does not exist"]
sales_order.valid?
# => false
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rlm_logistics/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
