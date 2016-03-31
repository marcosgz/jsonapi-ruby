require 'spec_helper'

describe JSONAPI::Configuration do

  it { expect(JSONAPI.configuration).to be_an_instance_of(described_class) }

  describe 'instance methods' do
    before do
      @original_config = JSONAPI.configuration.dup
    end
    after do
      JSONAPI.configuration = @original_config
    end
    let(:model) { JSONAPI.configuration }

    context '#json_key_format' do

      it { expect(model.json_key_format).to eq(:dasherized) }

      it { expect(model.key_formatter).to eq(JSONAPI::DasherizedFormatter) }

      it 'overwrite default configurations' do
        model.json_key_format = :camelized
        expect(model.json_key_format).to eq(:camelized)
        expect(model.key_formatter).to eq(JSONAPI::CamelizedFormatter)

        JSONAPI.configure{|c| c.json_key_format = :underscored }
        expect(model.json_key_format).to eq(:underscored)
        expect(model.key_formatter).to eq(JSONAPI::UnderscoredFormatter)
      end
    end

    context '#link_format' do

      it { expect(model.link_format).to eq(:dasherized) }

      it { expect(model.link_formatter).to eq(JSONAPI::DasherizedFormatter) }

      it 'overwrite default configurations' do
        model.link_format = :camelized
        expect(model.link_format).to eq(:camelized)
        expect(model.link_formatter).to eq(JSONAPI::CamelizedFormatter)

        JSONAPI.configure{|c| c.link_format = :underscored }
        expect(model.link_format).to eq(:underscored)
        expect(model.link_formatter).to eq(JSONAPI::UnderscoredFormatter)
      end
    end

  end
end
