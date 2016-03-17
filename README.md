# RLM Logistics

### Usage

`config/inializer/rlm.rb`

```ruby
RlmLogistics.config do |r|
  r.username      = "XXUSER"
  r.password      = "XXKEY"
  r.endpoint_path = "TESTServices"
end
```

**inventory**

```ruby
inventory = RlmLogistics::Record::Inventory.new(
  company_number:   90,
  retrieve_upcs:    'Y',
  division_number:  10,
  ats_positive:     'Y',
  ats_includes_wip: 'N'
)
inventory.save

inventory.parsed_data
# =>
# [
#   { upc: "CB11D10-BLUE-S",     quantity: 112 },
#   { upc: "CB11D10-BLUE-M",     quantity: 113 },
#   { upc: "CB11D10-BLUE-L",     quantity: 113 }
# ]
```

**error handling**

Validation and errors are handled by ActiveModel so error handling looks like this:

```ruby
inventory.errors.full_messages
# => ["The user/key combination does not exist"]
inventory.valid?
# => false
```
