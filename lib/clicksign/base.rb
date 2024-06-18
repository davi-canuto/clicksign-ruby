module Clicksign
  class Base
    def self.headers
      {
        accept: 'application/vnd.api+json',
        content_type: 'application/vnd.api+json',
        authorization: Clicksign.token
      }
    end

    def self.request(method, *params)
      params.last.merge!(headers)
      parse RestClient.public_send(method, *params)
    end

    def self.api_url(*path)
      ([Clicksign.endpoint] + path).join("/")
    end

    def self.parse(response)
      response = {} if response.empty?
      JSON[response]
    end

    def self.build_data(params, model_name, id='')
      data = {
        data: {
          attributes: params,
          type: model_name
        }
      }
      unless id.empty?
        data[:data][:id] = id
      end

      data.to_json
    end
  end
end