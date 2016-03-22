require 'spec_helper'

describe RlmLogistics::Record::Credit do

  describe '#as_soap' do

    let(:credit) do
      RlmLogistics::Record::Credit.new(
        company_number: 90,
        date_from:      20130131,
        date_to:        20130601
      )
    end
    let(:credit_xml) { xml_fixture(:credit_request) }

    it 'returns a credit object in xml format' do
      expect(credit.as_soap).to eq(credit_xml)
    end

  end

  describe '#valid?' do

    before do
      RlmLogistics.company = nil
    end

    let(:credit) { RlmLogistics::Record::Credit.new }

    it 'returns false when company_number is not present' do
      expect(credit.valid?).to eq(false)
    end

    it 'returns true when company_number is present' do
      credit.company_number = 10
      expect(credit.valid?).to eq(true)
    end

  end

end
