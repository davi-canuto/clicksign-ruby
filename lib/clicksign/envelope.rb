module Clicksign
  class Envelope < Base
    def self.model_name
      'envelopes'
    end

    def self.create params={}
      request :post,
        api_url(model_name),
        build_data(params, model_name),
        {}
    end

    def initialize(envelope_key)
      @envelope_key = envelope_key
    end

    def model_name
      self.class.model_name
    end

    def activate params={ status: 'running' }
      Base.request :patch,
        Base.api_url(model_name, @envelope_key),
        Base.build_data(params, model_name, @envelope_key),
        {}
    end
  end
end
