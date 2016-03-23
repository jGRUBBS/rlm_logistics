require 'rlm_logistics/record/read_attributes/item_read_attributes'

module RlmLogistics
  module Record
    class Item < Base

      action    "Item"
      operation "getSelected"

      authenticate

      attribute :company_number
      attribute :division_number
      attribute :season_code
      attribute :season_year
      attribute :style_number
      attribute :web_ready_only
      attribute :currency_type
      attribute :omit_discontinued
      attribute :retrieve_upcs
      attribute :start_row
      attribute :limit_rows

      validates_presence_of :company_number

    end
  end
end
