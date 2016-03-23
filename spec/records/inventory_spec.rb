require 'spec_helper'

describe RlmLogistics::Record::Inventory do

  let(:attrs) do
    {
      company_number: 90,
      retrieve_upcs: 'Y',
      division_number: 10,
      ats_positive: 'Y',
      ats_includes_wip: 'N'
    }
  end
  let(:inventory)     { RlmLogistics::Record::Inventory.new(attrs) }
  let(:inventory_xml) { xml_fixture(:inventory_request) }

  describe '#as_soap' do

    it 'returns a inventory object in xml format' do
      expect(inventory.as_soap).to eq(inventory_xml)
    end

  end

  describe '#valid?' do

    before do
      RlmLogistics.company = nil
    end

    it 'returns false if required fields are not present' do
      expect(RlmLogistics::Record::Inventory.new.valid?).to eq(false)
    end

  end

  describe '#where', :vcr do

    let(:error_messages) {["The user/key combination does not exist"]}

    context 'bad user credentials' do

      it 'returns error response' do
        # this VCR casset was recorded with invalid credentials
        inventory.save
        expect(inventory.errors.full_messages).to eq(error_messages)
        expect(inventory.valid?).to eq(false)
      end

    end

    let(:minimal_result) do
      [
        {
          upcs: "CB11D10-BLUE-S,CB11D10-BLUE-M,CB11D10-BLUE-L",
          ats: "112,113,113"
        },
        {
          upcs: "CB11E21-BLUE-S,CB11E21-BLUE-M,CB11E21-BLUE-L",
          ats: "106,106,103"
        },
        {
          upcs: "CB11E21-CORAL-S,CB11E21-CORAL-M,CB11E21-CORAL-L",
          ats: "84,85,85"
        },
        {
          upcs: "AAAAAAAAA-CORAL-XS",
          ats: "1"
        },
        {
          upcs: "CCTESTS-BLUE-XS,CCTESTS-BLUE-S,CCTESTS-BLUE-M,CCTESTS-BLUE-L",
          ats: "93,93,95,96"
        },
        {
          upcs: "CCTESTS-CORAL-XS,CCTESTS-CORAL-S,CCTESTS-CORAL-M,CCTESTS-CORAL-L",
          ats: "1,1,1,1"
        }
      ]
    end

    let(:required_data_result) do
      [
        {
          upcs: "CB11D10-BLUE-S,CB11D10-BLUE-M,CB11D10-BLUE-L",
          sizes: "S,M,L",
          color: "BLUE",
          style_number: "CB11D10",
          internal_sku_number: 4
        },
        {
          upcs: "CB11E21-BLUE-S,CB11E21-BLUE-M,CB11E21-BLUE-L",
          sizes: "S,M,L",
          color: "BLUE",
          style_number: "CB11E21",
          internal_sku_number: 9
        },
        {
          upcs: "CB11E21-CORAL-S,CB11E21-CORAL-M,CB11E21-CORAL-L",
          sizes: "S,M,L",
          color: "CORAL",
          style_number: "CB11E21",
          internal_sku_number: 9
        },
        {
          upcs: "AAAAAAAAA-CORAL-XS",
          sizes: "XS",
          color: "CORAL",
          style_number: "AAAAAAAAA",
          internal_sku_number: 5509
        },
        {
          upcs: "CCTESTS-BLUE-XS,CCTESTS-BLUE-S,CCTESTS-BLUE-M,CCTESTS-BLUE-L",
          sizes: "XS,S,M,L",
          color: "BLUE",
          style_number: "CCTESTS",
          internal_sku_number: 1827
        },
        {
          upcs: "CCTESTS-CORAL-XS,CCTESTS-CORAL-S,CCTESTS-CORAL-M,CCTESTS-CORAL-L",
          sizes: "XS,S,M,L",
          color: "CORAL",
          style_number: "CCTESTS",
          internal_sku_number: 1827
        }
      ]
    end

    let(:minimum_attrs)  { attrs.merge(minimal_results: true) }
    let(:required_attrs) { attrs.merge(required_data_only: true) }

    it 'returns inventory response with minimal results' do
      # this VCR casset was recorded with valid credentials
      inventories = RlmLogistics::Record::Inventory.where(minimum_attrs)
      attrs = inventories.collect(&:attributes).each do |attr|
        attr.slice!(:upcs, :ats)
      end
      expect(inventories.size).to eq(6)
      expect(inventories.first).to be_a(RlmLogistics::Record::Inventory)
      expect(attrs).to eq(minimal_result)
    end

    it 'returns inventory response with required data' do
      # this VCR casset was recorded with valid credentials
      inventories = RlmLogistics::Record::Inventory.where(required_attrs)
      attrs = inventories.collect(&:attributes).each do |attr|
        attr.slice!(:upcs, :sizes, :color, :style_number, :internal_sku_number)
      end
      expect(inventories.size).to eq(6)
      expect(inventories.first).to be_a(RlmLogistics::Record::Inventory)
      expect(attrs).to eq(required_data_result)
    end

  end

end
