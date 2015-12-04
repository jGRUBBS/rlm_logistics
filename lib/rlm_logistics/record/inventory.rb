module RlmLogistics
  module Record
    class Inventory < Base

      action    :item
      operation :get_inventory

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

      validates_presence :company_number

    end
  end
end
