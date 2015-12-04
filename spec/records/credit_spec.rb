require 'spec_helper'

describe RlmLogistics::Record::Credit do

  describe '#to_xml' do

    let(:credit) do
      RlmLogistics::Record::Credit.new(
        company_number: 10,
        date_from:      20130131,
        date_to:        20130601
      )
    end
    let(:credit_xml) { xml_fixture(:credit_request) }

    it 'returns a credit object in xml format' do
      expect(credit.to_xml).to eq(credit_xml)
    end

  end

end
