module RlmLogistics
  module Record
    class Credit < ActiveRecord::Remote::Base

      action    :billing
      operation :get_credits

      authenticate

      attribute :company_number
      attribute :division_number
      attribute :date_from
      attribute :date_to

      validates_presence_of :company_number

    end
  end
end
