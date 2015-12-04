module RlmLogistics
  module Record
    class Address < Base

      attribute :name
      attribute :address1
      attribute :address2
      attribute :city
      attribute :state
      attribute :zip
      attribute :country_code
      attribute :address_type

      validates_presence :name, :address1, :city, :state, :zip, :address_type

    end
  end
end
