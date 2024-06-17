module Clicksign
  class Base
    def self.headers
      {
        "Accept"=> 'application/vnd.api+json',
        "Content-Type"=> 'application/vnd.api+json',
        "Authorization"=> Clicksign.token
      }
    end

    def self.request(method, *params)
      params.last.merge! headers
      parse RestClient.public_send(method, *params)
    end

    def self.api_url(*path)
      Clicksign.endpoint + path
    end

    def self.parse(response)
      response = {} if response.empty?
      JSON[response]
    end
  end
end
