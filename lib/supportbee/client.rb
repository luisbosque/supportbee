require_relative 'client/tickets.rb'
require 'json'

module Supportbee
  class Client

    include Supportbee::Client::Tickets

    def initialize(options={})
      @company = options[:company]
      @host = "https://#{@company}.supportbee.com"
      @auth_token = options[:auth_token]
      @conn = Faraday.new(:url => @host) do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

  end
end
