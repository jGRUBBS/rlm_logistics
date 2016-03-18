require 'spec_helper'

describe RlmLogistics::Record::Item do

  let(:item) do
    RlmLogistics::Record::Item.new(
      company_number:  90,
      division_number: 10,
      retrieve_upcs:   "Y"
    )
  end

  describe '#as_soap' do
    let(:item_xml) { xml_fixture(:item_request) }

    it 'returns a item object in xml format' do
      expect(item.as_soap).to eq(item_xml)
    end

  end

  describe '#save', :vcr do

    it 'returns item response' do
      expect{ item.save }.not_to raise_error
    end

  end

end
