require 'spec_helper'

describe RlmLogistics::Record::Line do

  describe '#valid?' do

    let(:line) { RlmLogistics::Record::Line.new }

    it 'returns false when required fields are not present' do
      expect(line.valid?).to eq(false)
    end

    it 'returns true when required fields are present' do
      line.sku_number = 10
      line.color      = "blue"
      line.size       = "xl"
      line.price      = 10.25
      line.quantity   = 2
      expect(line.valid?).to eq(true)
    end

  end

  describe '#full_error_messages' do

    let(:line) { RlmLogistics::Record::Line.new }
    let(:msg)  { "sku_number, color, size, price, quantity can't be blank" }

    it 'returns full error messages' do
      expect(line.full_error_messages).to eq(msg)
    end

  end

end
