module RlmLogistics
  module Record
    class PackedOrder < ActiveRecord::Remote::Base

      action    :packed_orders
      operation :get_selected

      authenticate

      attribute :company_number
      attribute :division_number
      attribute :rlm_pickticket_number
      attribute :rlm_order_number
      attribute :customer_po
      attribute :date_from
      attribute :date_to

      validates_presence :company_number

    end
  end
end
