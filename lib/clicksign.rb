require 'rest-client'
require 'json/ext'

require 'clicksign/version'
require 'clicksign/base'
require 'clicksign/envelope'
require 'clicksign/document'
require 'clicksign/signer'

module Clicksign
  class << self
    attr_accessor :endpoint, :token, :api_version, :environment, :host
  end

  def self.configure(&block)
    self.api_version = 'v3'
    self.environment = :sandbox

    if self.environment.to_sym == :production
      self.host = "https://app.clicksign.com"
    else
      self.host = "https://sandbox.clicksign.com"
    end

    self.endpoint = self.host + "/api/#{self.api_version}"

    yield self
  end
end
