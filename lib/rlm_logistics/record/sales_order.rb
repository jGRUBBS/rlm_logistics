module RlmLogistics
  module Record
    class SalesOrder < Base

      action    :sale_order_no_account
      operation :create

      authenticate

      attribute :company_number
      attribute :division_number
      attribute :single_division
      attribute :email
      attribute :currency
      attribute :routing
      attribute :terms
      attribute :warehouse
      attribute :sales_rep
      attribute :department
      attribute :order_date
      attribute :start_date
      attribute :cancel_date
      attribute :customer_po
      attribute :special01
      attribute :special02
      attribute :special03
      attribute :special04
      attribute :discount
      attribute :tax_id
      attribute :tax_amount
      attribute :shipping_amount
      attribute :rush_pt
      attribute :bulk_flag

      has_many :addresses
      has_many :details, collection: :line

      validates_presence_of :company_number, :currency, :order_date, :start_date,
                            :cancel_date, :addresses, :details

    end
  end
end
