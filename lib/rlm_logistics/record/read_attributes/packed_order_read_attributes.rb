module PackedOrderReadAttributes

  def self.extended(base)
    base.class.attribute :company_name
    base.class.attribute :division_name
    base.class.attribute :customer_number
    base.class.attribute :customer_name
    base.class.attribute :store_number
    base.class.attribute :store_name
    base.class.attribute :store_email_address
    base.class.attribute :customerpo_number
    base.class.attribute :packed_date
    base.class.attribute :routing_code
    base.class.attribute :routing_description
    base.class.attribute :tracking_number
    base.class.attribute :clearpath_customer_number
    base.class.attribute :clearpath_customer_id
    base.class.attribute :rec_details
  end

end
