module Clicksign
  class Document < Base
    def self.model_name
      'documents'
    end

    attr_accessor :envelope_key

    def initialize(envelope_key)
      @envelope_key = envelope_key
    end

    def model_name
      self.class.model_name
    end

    def add params={}
      Base.request :post,
        Base.api_url('envelopes', @envelope_key, model_name),
        Base.build_data(params, model_name),
        {}
    end
  end
end