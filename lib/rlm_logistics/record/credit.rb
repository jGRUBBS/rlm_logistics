module RlmLogistics
  module Record
    class Credit < Base

      action    :billing
      operation :get_credits

      authenticate

      attribute :company_number
      attribute :division_number
      attribute :date_from
      attribute :date_to

      validates_presence :company_number

    end
  end
end
