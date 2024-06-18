require 'spec_helper'

describe Clicksign do
  describe '.configure' do
    before do
      Clicksign.configure do |config|
        config.token       = 'my_token'
        config.environment = :sandbox
      end
    end

    it 'set config values' do
      expect(Clicksign.environment).to eq :sandbox
      expect(Clicksign.endpoint).to eq "https://sandbox.clicksign.com/api/v3"
      expect(Clicksign.token).to eq 'my_token'
    end
  end
end

describe Clicksign::Envelope do
  describe '.create' do
    it 'create envelope with only required parameters' do
      # was supposed to have tests xD
    end
  end
end