module RlmLogistics
  module Record
    class Address < Base

      attribute :name,         String, as: :name
      attribute :address1,     String, as: :address1
      attribute :address2,     String, as: :address2
      attribute :city,         String, as: :city
      attribute :state,        String, as: :state
      attribute :zip,          String, as: :zip
      attribute :country_code, String, as: :country_code
      attribute :address_type, String, as: :address_type

      validates_presence_of :name, :address1, :city, :state, :zip, :address_type

    end
  end
end
