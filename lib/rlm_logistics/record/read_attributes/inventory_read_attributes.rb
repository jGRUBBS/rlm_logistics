module InventoryReadAttributes

  def self.extended(base)
    base.class.attribute :ats
    base.class.attribute :color
    base.class.attribute :sizes
  end

end
