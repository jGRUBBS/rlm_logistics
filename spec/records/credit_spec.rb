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

  let(:credits) { RlmLogistics::Record::Credit.where(company_number: 1) }

  let(:expected_result) do
    [
      {
        season_year:       "S14",
        style:             "AAAAAAAAA TEST",
        skunumber:         "5509",
        style_description: "Test Style",
        color:             "CORAL",
        size:              "XS",
        units:             "1",
        unit_price:        "100.00"
      }
    ]
  end

  describe '#where', :vcr do

    it 'returns credits collection' do
      attrs = credits.collect(&:attributes).each do |attr|
        attr.slice!(
          :season_year, :style, :skunumber, :style_description, :color, :size,
          :units, :unit_price
        )
      end
      expect(attrs).to eq(expected_result)
    end

    it 'returns an empty array when the api returns an invalid response' do
      expect(credits).to eq([])
    end

    it 'returns an empty array if no results are found' do
      credits = RlmLogistics::Record::Credit.where(company_number: 90)
      expect(credits).to eq([])
    end

  end

end
