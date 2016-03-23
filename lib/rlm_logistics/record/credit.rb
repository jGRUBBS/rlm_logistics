require 'rlm_logistics/record/read_attributes/credit_read_attributes'

module RlmLogistics
  module Record
    class Credit < Base

      action    "Billing"
      operation "getCredits"

      authenticate

      attribute :company_number
      attribute :division_number
      attribute :date_from
      attribute :date_to

      validates_presence_of :company_number

    end
  end
end
