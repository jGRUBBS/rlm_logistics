require 'spec_helper'

describe RlmLogistics::Record::SalesOrder do

  describe '#to_xml' do

    let(:shipping_address) do
      {
        name:         "My Name",
        address1:     "ad1",
        address2:     "ad2",
        city:         "My city",
        state:        "My state",
        zip:          "My zip",
        country_code: "USA",
        address_type: "S"
      }
    end

    let(:billing_address) do
      {
        name:         "My Name",
        address1:     "ad10",
        city:         "My city",
        state:        "My state",
        zip:          "My zip",
        address_type: "B"
      }
    end

    let(:sales_order) do
      RlmLogistics::Record::SalesOrder.new(
        company_number:  10,
        division_number: 50,
        email:           "customer@gmail.com",
        currency:        "$",
        order_date:      20120115,
        start_date:      20120115,
        cancel_date:     20120115,
        customer_po:     "YOURPO#",
        special01:       101,
        special02:       102,
        special03:       103,
        special04:       104,
        discount:        0.05,
        addresses: [
          shipping_address,
          billing_address
        ],
        details: [
          {
            sku_number: 100566,
            style:      "AE234033",
            color:      "12MCL",
            size:       "34",
            price:      10.99,
            quantity:   12
          }
        ]
      )
    end
    let(:sales_order_xml) { xml_fixture(:sales_order_request) }

    it 'returns a sales_order object in xml format', focus: true do
      expect(sales_order.to_xml).to eq(sales_order_xml)
    end

  end

end
