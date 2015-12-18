module RlmLogistics
  module Record
    class Address < ActiveRecord::Remote::Base

      attribute :name
      attribute :address1
      attribute :address2
      attribute :city
      attribute :state
      attribute :zip
      attribute :country_code
      attribute :address_type

      validates_presence_of :name, :address1, :city, :state, :zip, :address_type

    end
  end
end
