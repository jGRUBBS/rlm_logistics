module RlmLogistics
  module Record
    class Line < Base

      attribute :sku_number
      attribute :color
      attribute :size
      attribute :price
      attribute :quantity
      attribute :style
      attribute :line_tax_amount
      attribute :line_state_tax_amount
      attribute :line_country_tax_amount
      attribute :line_city_tax_amount
      attribute :line_other_tax_amount
      attribute :line_tax_percent

      validates_presence :sku_number, :color, :size, :price, :quantity

    end
  end
end
