module Clicksign
  class Signer < Base
    def self.model_name
      'signers'
    end

    def self.add(params = {})
      signers = params.delete(:signers)
      params['signers'] = [signers].flatten(1) if signers

      request :post,
        api_url('/envelopes'),
        { "document[archive][original]" => file }.merge(params),
        {}
    end

    def self.find(key)
    end

    def self.remove(key)
    end
  end
end
