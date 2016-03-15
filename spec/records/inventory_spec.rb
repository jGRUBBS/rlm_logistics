require 'spec_helper'

describe RlmLogistics::Record::Inventory do

  describe '#as_soap' do

    let(:inventory) { RlmLogistics::Record::Inventory.new(company_number: 90) }
    let(:inventory_xml) { xml_fixture(:inventory_request) }

    it 'returns a inventory object in xml format' do
      expect(inventory.as_soap).to eq(inventory_xml)
    end

  end

end
