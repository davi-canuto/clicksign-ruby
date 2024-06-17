module Clicksign
  class Document < Base
    def self.model_name
      'documents'
    end

    attr_accessor :envelope_key

    def initialize(envelope_key)
      @envelope_key = envelope_key
    end

    def add
      Base.request :get,
        Base.api_url('documents'),
        {}
    end

    def find(key)
      request :get,
        api_url('documents', key),
        {}
    end

    def update(file, params = {})
      signers = params.delete(:signers)
      params['signers'] = [signers].flatten(1) if signers

      request :post,
        api_url('documents'),
        { "document[archive][original]" => file }.merge(params),
        {}
    end

    def remove(file, params = {})
      signers = params.delete(:signers)
      params['signers'] = [signers].flatten(1) if signers

      request :post,
        api_url('documents'),
        { "document[archive][original]" => file }.merge(params),
        {}
    end
  end
end