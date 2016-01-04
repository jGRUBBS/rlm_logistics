require 'spec_helper'

describe RlmLogistics::Record::Inventory do

  describe '#as_xml' do

    let(:inventory) do
      RlmLogistics::Record::Inventory.new(
        company_number:  1,
        division_number: 10,
        season_code:     "R",
        season_year:     11,
        style_number:    "1R11007"
      )
    end
    let(:inventory_xml) { xml_fixture(:inventory_request) }

    it 'returns a inventory object in xml format' do
      expect(inventory.as_xml).to eq(inventory_xml)
    end

  end

end
