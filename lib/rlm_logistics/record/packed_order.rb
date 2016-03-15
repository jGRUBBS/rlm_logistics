module RlmLogistics
  module Record
    class PackedOrder < Base

      action    "PackedOrders"
      operation "getSelected"

      authenticate

      attribute :company_number
      attribute :division_number
      attribute :rlm_pickticket_number
      attribute :rlm_order_number
      attribute :customer_po
      attribute :date_from
      attribute :date_to

      validates_presence_of :company_number

    end
  end
end
