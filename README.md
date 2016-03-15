# RLM Logistics

### Notes

- for sales order why are the following fields all required?
  - :order_date
  - :start_date
  - :cancel_date

- for address why is state required?
  - what about orders from countries where state is not required?

- for address why is zip required?
  - what about orders from countries where zip is not required? i.e. Ireland

### Usage

`config/inializer/rlm.rb`

```ruby
RlmLogistics.config do |r|
  r.username      = "XXUSER"
  r.password      = "XXKEY"
  r.endpoint_path = "TESTServices"
end
```
