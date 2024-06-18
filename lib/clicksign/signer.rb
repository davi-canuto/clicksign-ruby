module Clicksign
  class Signer < Base
    def self.model_name
      'signers'
    end

    attr_accessor :envelope_key

    def initialize(envelope_key)
      @envelope_key = envelope_key
    end

    def add params={}
      Base.request :post,
        Base.api_url('envelopes', @envelope_key, Signer.model_name),
        Base.build_data(params, { type: Signer.model_name }),
        {}
    end
  end
end