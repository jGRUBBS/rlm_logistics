module RlmLogistics
  module Record
    class SalesOrder < Base

      action       "SalesOrderNoAccount"
      operation    "create"
      base_element "orderXML"

      authenticate strict: true

      attribute :id
      attribute :company_number,  Integer, as: :company
      attribute :division_number, Integer, as: :division
      attribute :single_division, String,  as: :singleDivision
      attribute :email,           String,  as: :email
      attribute :currency,        String,  as: :currency
      attribute :routing,         String,  as: :routing
      attribute :terms,           Integer, as: :terms
      attribute :warehouse,       Integer, as: :warehouse
      attribute :sales_rep,       String,  as: :salesRep
      attribute :department,      String,  as: :department
      attribute :order_date,      Integer, as: :orderDate
      attribute :start_date,      Integer, as: :startDate
      attribute :cancel_date,     Integer, as: :cancelDate
      attribute :customer_po,     String,  as: :customerPO
      attribute :special01,       String,  as: :special01
      attribute :special02,       String,  as: :special02
      attribute :special03,       String,  as: :special03
      attribute :special04,       String,  as: :special04
      attribute :discount,        Decimal, as: :discount
      attribute :tax_id,          String,  as: :taxID
      attribute :tax_amount,      String,  as: :taxAmount
      attribute :shipping_amount, String,  as: :shippingAmount
      attribute :rush_pt,         String,  as: :rushPT
      attribute :bulk_flag,       String,  as: :bulkFlag
      attribute :order_numbers,   Array,   internal: true

      has_many :addresses, strict: true
      has_many :details, collection: :line, strict: true

      validates_presence_of :company_number, :currency, :order_date, :start_date,
                            :cancel_date, :addresses, :details

      def soap_options
        super.merge(root: "order")
      end

      def parse(response)
        self.id = if response.data.is_a?(Array)
          self.order_numbers = response.data.map(&:to_i)
          response.data.first.to_i
        else
          response.data.to_i
        end
      end

    end
  end
end
