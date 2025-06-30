require 'clicksign/envelope'

module Clicksign
  class Signer < Base
    def self.model_name
      'signers'
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

    def delete params={}
      signer_key = params[:signer_key]
      raise StandardError, 'Signer key is required' unless signer_key.present?

      envelope = Clicksign::Envelope.new(@envelope_key).retrieve
      raise StandardError, "Envelope #{@envelope_key} not in state for delete." unless envelope["data"]["attributes"]["status"].in? ["running", "draft"]

      Base.request :delete,
        Base.api_url('envelopes', @envelope_key, model_name, params[:signer_key]),
        {}
    end

    def update params={}
      self.delete(params)
      self.add(params)
    end
  end
end