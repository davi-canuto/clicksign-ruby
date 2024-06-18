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

    def self.find key
      request :get,
        api_url(model_name, key),
        {}
    end

    def self.update params={}, key
      unless params[:data]&[:id]
        raise 'must_send_envelope_id_inside_body'
      end

      request :patch,
        api_url(model_name, key),
        build_data(params, model_name, key ),
        {}
    end

    def self.remove key
      request :delete,
        api_url(model_name, key),
        {}
    end
  end
end
