require 'spec_helper'

describe RlmLogistics::Record::SalesOrder do

  describe '#to_xml' do

    let(:sales_order) do
      RlmLogistics::Record::SalesOrder.new(
        company_number: 10
      )
    end
    let(:sales_order_xml) { xml_fixture(:sales_order_request) }

    it 'returns a sales_order object in xml format' do
      expect(sales_order.to_xml).to eq(sales_order_xml)
    end

  end

end
