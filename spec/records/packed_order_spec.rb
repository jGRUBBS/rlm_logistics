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

end
