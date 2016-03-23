require 'rlm_logistics/record/read_attributes/inventory_read_attributes'

module RlmLogistics
  module Record
    class Inventory < Base

      action    "Item"
      operation "getInventory"

      authenticate

      attribute :company_number
      attribute :division_number
      attribute :season_code
      attribute :season_year
      attribute :internal_sku_number, Integer
      attribute :style_number
      attribute :fabric
      attribute :length
      attribute :warehouse
      attribute :retrieve_upcs
      attribute :ats_positive
      attribute :ats_includes_wip
      attribute :ats_includes_openorders
      attribute :limit_rows
      attribute :upcs
      attribute :minimal_results
      attribute :required_data_only

      validates_presence_of :company_number

    end
  end
end
