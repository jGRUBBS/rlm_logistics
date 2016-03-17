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

    let(:error_messages) {["The user/key combination does not exist"]}

    before { inventory.save }

    context 'bad user credentials' do

      it 'returns error response' do
        # this VCR casset was recorded with invalid credentials
        expect(inventory.errors.full_messages).to eq(error_messages)
        expect(inventory.valid?).to eq(false)
      end

    end

    let(:expected_result) do
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

    it 'returns inventory response' do
      # this VCR casset was recorded with valid credentials
      expect(inventory.valid?).to eq(true)
      expect(inventory.parsed_data).to eq(expected_result)
    end

  end

end
