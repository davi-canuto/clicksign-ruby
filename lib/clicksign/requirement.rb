module Clicksign
  class Requirement < Base
    def self.model_name
      'requirements'
    end

    attr_accessor :envelope_key

    def initialize(envelope_key)
      @envelope_key = envelope_key
    end

    def model_name
      self.class.model_name
    end

    def add_bulk_requirements params={}
      Base.request :post,
        Base.api_url('envelopes', @envelope_key, "bulk_requirements"),
        params.to_json,
        {}
    end 

    def add params={}, custom_params={}
      Base.request :post,
        Base.api_url('envelopes', @envelope_key, model_name),
        Base.build_data(params, model_name, '', custom_params),
        {}
    end
  end
end