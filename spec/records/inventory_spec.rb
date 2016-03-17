require 'spec_helper'

describe RlmLogistics::Record::Inventory do

  let(:inventory) do
    RlmLogistics::Record::Inventory.new(
      company_number: 90,
      retrieve_upcs: 'Y',
      division_number: 10,
      ats_positive: 'Y',
      ats_includes_wip: 'N'
    )
  end
  let(:inventory_xml) { xml_fixture(:inventory_request) }

  describe '#as_soap' do

    it 'returns a inventory object in xml format' do
      expect(inventory.as_soap).to eq(inventory_xml)
    end

  end

  describe '#valid?' do

    it 'returns false if required fields are not present' do
      expect(RlmLogistics::Record::Inventory.new.valid?).to eq(false)
    end

  end

  describe '#save', :vcr do

    before { inventory.save }

    context 'bad user credentials' do

      it 'returns error response' do
        # this VCR casset was recorded with invalid credentials
        expect(inventory.errors.size).to eq(1)
        expect(inventory.valid?).to eq(false)
      end

    end

    it 'returns inventory response' do
      # this VCR casset was recorded with valid credentials
      expect(inventory.valid?).to eq(true)
    end

  end

end
