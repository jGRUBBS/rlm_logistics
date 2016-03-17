require 'spec_helper'

describe RlmLogistics::Record::SalesOrder do

  let(:shipping_address) do
    {
      name:         "My Name",
      address1:     "ad1",
      address2:     "ad2",
      city:         "My city",
      state:        "NY",
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
      state:        "NY",
      zip:          "My zip",
      address_type: "B"
    }
  end

  let(:sales_order) do
    RlmLogistics::Record::SalesOrder.new(
      company_number:  90,
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
      warehouse:       1,
      addresses: [
        shipping_address,
        billing_address
      ],
      details: [
        {
          sku_number: 4,
          style:      "CB11D10",
          color:      "BLUE",
          size:       "S",
          price:      10.99,
          quantity:   1
        }
      ]
    )
  end

  describe '#as_soap' do
    let(:sales_order_xml) { xml_fixture(:sales_order_request) }

    it 'returns a sales_order object in xml format' do
      expect(sales_order.as_soap).to eq(sales_order_xml)
    end

  end

  describe '#save', :vcr do

    it 'submits an order successfully' do
      sales_order.save
      expect(sales_order.id).not_to be_nil
    end

    context 'invalid color' do
      let(:error_messages) {["Invalid Color on Line 1"]}
      before { sales_order.details.first.color = "invalid" }

      it 'returns error' do
        sales_order.save
        expect(sales_order.errors.full_messages).to eq(error_messages)
      end
    end

    context 'invalid company' do
      let(:error_messages) {["Invalid Company"]}
      before { sales_order.company_number = 10 }

      it 'returns error' do
        sales_order.save
        expect(sales_order.errors.full_messages).to eq(error_messages)
      end
    end

    context 'invalid size' do
      let(:error_messages) {["Invalid Size on Line 1"]}
      before { sales_order.details.first.size = "invalid" }

      it 'returns error' do
        sales_order.save
        expect(sales_order.errors.full_messages).to eq(error_messages)
      end
    end

    context 'invalid sku number' do
      let(:error_messages) {["Invalid SKU Number on Line 1"]}
      before { sales_order.details.first.sku_number = "invalid" }

      it 'returns error' do
        sales_order.save
        expect(sales_order.errors.full_messages).to eq(error_messages)
      end
    end

    context 'invalid shipping state' do
      let(:error_messages) {["Shipping State Too Long. Max 2 Characters"]}
      before { sales_order.addresses.first.state = "invalid" }

      it 'returns error' do
        sales_order.save
        expect(sales_order.errors.full_messages).to eq(error_messages)
      end
    end

    context 'sku style mismatch' do
      let(:error_messages) do
        ["SKU Number Does Not Match With Style Passed on Line 1"]
      end
      before { sales_order.details.first.style = "AAAAAAAAA" }

      it 'returns error' do
        sales_order.save
        expect(sales_order.errors.full_messages).to eq(error_messages)
      end
    end

    context 'invalid warehouse' do
      let(:error_messages) { ["Invalid Warehouse"] }
      before { sales_order.warehouse = "invalid" }

      it 'returns error' do
        sales_order.save
        expect(sales_order.errors.full_messages).to eq(error_messages)
      end
    end

    context 'no warehouse' do
      let(:error_messages) do
        ["No Warehouse Was Received And There Is No Setup For A Preferred One"]
      end
      before { sales_order.warehouse = nil }

      it 'returns error' do
        sales_order.save
        expect(sales_order.errors.full_messages).to eq(error_messages)
      end
    end

  end

end
