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

    before do
      RlmLogistics.company = nil
    end

    it 'returns false if required fields are not present' do
      expect(RlmLogistics::Record::Inventory.new.valid?).to eq(false)
    end

  end

  describe '#save', :vcr do

    let(:error_messages) {["The user/key combination does not exist"]}

    context 'bad user credentials' do

      it 'returns error response' do
        # this VCR casset was recorded with invalid credentials
        inventory.save
        expect(inventory.errors.full_messages).to eq(error_messages)
        expect(inventory.valid?).to eq(false)
      end

    end

    let(:expected_minimal_result) do
      [
        { upc: "CB11D10-BLUE-S",     quantity: 112 },
        { upc: "CB11D10-BLUE-M",     quantity: 113 },
        { upc: "CB11D10-BLUE-L",     quantity: 113 },
        { upc: "CB11E21-BLUE-S",     quantity: 106 },
        { upc: "CB11E21-BLUE-M",     quantity: 106 },
        { upc: "CB11E21-BLUE-L",     quantity: 103 },
        { upc: "CB11E21-CORAL-S",    quantity: 84  },
        { upc: "CB11E21-CORAL-M",    quantity: 85  },
        { upc: "CB11E21-CORAL-L",    quantity: 85  },
        { upc: "AAAAAAAAA-CORAL-XS", quantity: 1   },
        { upc: "CCTESTS-BLUE-XS",    quantity: 93  },
        { upc: "CCTESTS-BLUE-S",     quantity: 93  },
        { upc: "CCTESTS-BLUE-M",     quantity: 95  },
        { upc: "CCTESTS-BLUE-L",     quantity: 96  },
        { upc: "CCTESTS-CORAL-XS",   quantity: 1   },
        { upc: "CCTESTS-CORAL-S",    quantity: 1   },
        { upc: "CCTESTS-CORAL-M",    quantity: 1   },
        { upc: "CCTESTS-CORAL-L",    quantity: 1   }
      ]
    end

    let(:expected_required_data_result) do
      [
        { upc: "CB11D10-BLUE-S",     size: "S",  color: "BLUE",  style: "CB11D10",   sku: 4    },
        { upc: "CB11D10-BLUE-M",     size: "M",  color: "BLUE",  style: "CB11D10",   sku: 4    },
        { upc: "CB11D10-BLUE-L",     size: "L",  color: "BLUE",  style: "CB11D10",   sku: 4    },
        { upc: "CB11E21-BLUE-S",     size: "S",  color: "BLUE",  style: "CB11E21",   sku: 9    },
        { upc: "CB11E21-BLUE-M",     size: "M",  color: "BLUE",  style: "CB11E21",   sku: 9    },
        { upc: "CB11E21-BLUE-L",     size: "L",  color: "BLUE",  style: "CB11E21",   sku: 9    },
        { upc: "CB11E21-CORAL-S",    size: "S",  color: "CORAL", style: "CB11E21",   sku: 9    },
        { upc: "CB11E21-CORAL-M",    size: "M",  color: "CORAL", style: "CB11E21",   sku: 9    },
        { upc: "CB11E21-CORAL-L",    size: "L",  color: "CORAL", style: "CB11E21",   sku: 9    },
        { upc: "AAAAAAAAA-CORAL-XS", size: "XS", color: "CORAL", style: "AAAAAAAAA", sku: 5509 },
        { upc: "CCTESTS-BLUE-XS",    size: "XS", color: "BLUE",  style: "CCTESTS",   sku: 1827 },
        { upc: "CCTESTS-BLUE-S",     size: "S",  color: "BLUE",  style: "CCTESTS",   sku: 1827 },
        { upc: "CCTESTS-BLUE-M",     size: "M",  color: "BLUE",  style: "CCTESTS",   sku: 1827 },
        { upc: "CCTESTS-BLUE-L",     size: "L",  color: "BLUE",  style: "CCTESTS",   sku: 1827 },
        { upc: "CCTESTS-CORAL-XS",   size: "XS", color: "CORAL", style: "CCTESTS",   sku: 1827 },
        { upc: "CCTESTS-CORAL-S",    size: "S",  color: "CORAL", style: "CCTESTS",   sku: 1827 },
        { upc: "CCTESTS-CORAL-M",    size: "M",  color: "CORAL", style: "CCTESTS",   sku: 1827 },
        { upc: "CCTESTS-CORAL-L",    size: "L",  color: "CORAL", style: "CCTESTS",   sku: 1827 }
      ]
    end

    it 'returns inventory response with minimal results' do
      # this VCR casset was recorded with valid credentials
      inventory.minimal_results = true
      inventory.save
      expect(inventory.valid?).to eq(true)
      expect(inventory.parsed_data).to eq(expected_minimal_result)
    end

    it 'returns inventory response with required data' do
      # this VCR casset was recorded with valid credentials
      inventory.required_data_only = true
      inventory.save
      expect(inventory.valid?).to eq(true)
      expect(inventory.parsed_data).to eq(expected_required_data_result)
    end

  end

end
