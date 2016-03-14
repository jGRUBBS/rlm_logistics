module RlmLogistics
  module Record
    class Line < Base

      attribute :sku_number,              Integer, as: :SKUNumber
      attribute :style,                   String,  as: :style
      attribute :color,                   String,  as: :color
      attribute :size,                    String,  as: :size
      attribute :price,                   Decimal, as: :price
      attribute :quantity,                Integer, as: :quantity
      attribute :line_tax_amount,         Decimal, as: :lineTaxAmount
      attribute :line_state_tax_amount,   Decimal, as: :lineStateTaxAmount
      attribute :line_country_tax_amount, Decimal, as: :lineCountryTaxAmount
      attribute :line_city_tax_amount,    Decimal, as: :lineCityTaxAmount
      attribute :line_other_tax_amount,   Decimal, as: :lineOtherTaxAmount
      attribute :line_tax_percent,        Decimal, as: :lineTaxPercent

      validates_presence_of :sku_number, :color, :size, :price, :quantity

    end
  end
end
