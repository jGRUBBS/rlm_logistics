module CreditReadAttributes

  def self.extended(base)
    base.class.attribute :season_year
    base.class.attribute :style
    base.class.attribute :skunumber
    base.class.attribute :style_description
    base.class.attribute :color
    base.class.attribute :size
    base.class.attribute :upc_number
    base.class.attribute :units
    base.class.attribute :unit_price
  end

end
