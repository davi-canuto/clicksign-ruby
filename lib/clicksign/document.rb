module Clicksign
  class Document < Base
    def self.create(params = {})
      signers = params.delete(:signers)
      params['signers'] = [signers].flatten(1) if signers

      request :post,
        api_url('/envelopes'),
        { "document[archive][original]" => file }.merge(params),
        {}
    end
  end
end
