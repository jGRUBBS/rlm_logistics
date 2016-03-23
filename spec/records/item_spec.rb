require 'spec_helper'

describe RlmLogistics::Record::Item do

  describe '#as_soap' do
    let(:item) do
      RlmLogistics::Record::Item.new(
        company_number:  90,
        division_number: 10,
        retrieve_upcs:   "Y"
      )
    end
    let(:item_xml) { xml_fixture(:item_request) }

    it 'returns a item object in xml format' do
      expect(item.as_soap).to eq(item_xml)
    end

  end

  describe '#where', :vcr do

    let(:attrs) do
      {
        company_number:  90,
        division_number: 10,
        retrieve_upcs:   "Y"
      }
    end
    let(:items) { RlmLogistics::Record::Item.where(attrs) }

    it 'returns item response' do
      expect(items.size).to eq(325)
      expect(items.first).to be_a(RlmLogistics::Record::Item)
    end

  end

end
