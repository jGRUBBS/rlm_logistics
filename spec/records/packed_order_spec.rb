require 'spec_helper'

describe RlmLogistics::Record::PackedOrder do

  describe '#as_soap' do

    before do
      RlmLogistics.company = 10
    end

    let(:packed_order) do
      RlmLogistics::Record::PackedOrder.new(
        date_from:      20130131,
        date_to:        20130601
      )
    end
    let(:packed_order_xml) { xml_fixture(:packed_order_request) }

    it 'returns a packed_order object in xml format' do
      expect(packed_order.as_soap).to eq(packed_order_xml)
    end

  end

  let(:packed_orders) { RlmLogistics::Record::PackedOrder.all }
  let(:expected_result) do
    [
      {
        division_number:       "10",
        rlm_pickticket_number: "1",
        rlm_order_number:      "2",
        company_name:          "Test Company TEST COMPANY",
        division_name:         "Test Company Test Div",
        customer_number:       "TESTING",
        customer_name:         "Test Account",
        store_number:          "1",
        store_name:            "Tim Test",
        store_email_address:   nil,
        customerpo_number:     "55445",
        packed_date:           "20140401",
        routing_code:          "UPS",
        routing_description:   "UPS",
        tracking_number:       nil
      },
      {
        division_number:       "10",
        rlm_pickticket_number: "4",
        rlm_order_number:      "1",
        company_name:          "Test Company TEST COMPANY",
        division_name:         "Test Company Test Div",
        customer_number:       "TESTING",
        customer_name:         "Test Account",
        store_number:          "1",
        store_name:            "Tim Test",
        store_email_address:   nil,
        customerpo_number:     "12356",
        packed_date:           "20140612",
        routing_code:          "UPS",
        routing_description:   "UPS",
        tracking_number:       "41346567567Y"
      },
      {
        division_number:       "10",
        rlm_pickticket_number: "6",
        rlm_order_number:      "6",
        company_name:          "Test Company TEST COMPANY",
        division_name:         "Test Company Test Div",
        customer_number:       "TESTING",
        customer_name:         "Test Account",
        store_number:          "1",
        store_name:            "Tim Test",
        store_email_address:   nil,
        customerpo_number:     "32ABV",
        packed_date:           "20140707",
        routing_code:          "UPS",
        routing_description:   "UPS",
        tracking_number:       nil
      }
    ]
  end

  describe '#where', :vcr do

    it 'returns packed orders collection' do
      attrs = packed_orders.collect(&:attributes).each do |attr|
        attr.slice!(
          :division_number,
          :rlm_pickticket_number,
          :rlm_order_number,
          :company_name,
          :division_name,
          :customer_number,
          :customer_name,
          :store_number,
          :store_name,
          :store_email_address,
          :customerpo_number,
          :packed_date,
          :routing_code,
          :routing_description,
          :tracking_number
        )
      end
      expect(packed_orders.size).to eq(3)
      expect(attrs).to eq(expected_result)
    end

  end

end
