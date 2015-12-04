require 'spec_helper'

describe RlmLogistics::Record::Base do

  context 'class methods' do

    it 'responds to .attribute' do
      expect(RlmLogistics::Record::Base.respond_to?(:attribute)).to eq(true)
    end

    it 'responds to .has_many' do
      expect(RlmLogistics::Record::Base.respond_to?(:has_many)).to eq(true)
    end

    it 'responds to .validates_presence' do
      expect(RlmLogistics::Record::Base.respond_to?(:validates_presence)).to eq(true)
    end

    it 'responds to .action' do
      expect(RlmLogistics::Record::Base.respond_to?(:action)).to eq(true)
    end

    it 'responds to .operation' do
      expect(RlmLogistics::Record::Base.respond_to?(:operation)).to eq(true)
    end

  end

  context 'instance methods' do

    let(:base_instance) { RlmLogistics::Record::Base.new }

    it 'responds to #to_xml' do
      expect(base_instance.respond_to?(:to_xml)).to eq(true)
    end

  end

end
