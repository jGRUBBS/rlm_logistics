require 'spec_helper'

describe RlmLogistics::Record::Item do

  describe '#as_xml' do

    let(:item) do
      RlmLogistics::Record::Item.new(
        company_number:  1,
        division_number: 10,
        season_code:     "R",
        season_year:     11,
        style_number:    "1R11007",
        web_ready_only:  "Y",
        retrieve_upcs:   "N",
        limit_rows:      50
      )
    end
    let(:item_xml) { xml_fixture(:item_request) }

    it 'returns a item object in xml format' do
      expect(item.as_xml).to eq(item_xml)
    end

  end

end
