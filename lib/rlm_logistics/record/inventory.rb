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
      attribute :internal_sku_number
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

      validates_presence_of :company_number

    end
  end
end
