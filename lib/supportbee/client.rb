require_relative 'client/tickets.rb'
require_relative 'client/agents.rb'
require_relative 'client/groups.rb'
require 'json'

module Supportbee
  class Client

    include Supportbee::Client::Tickets

    def initialize(options={})
      @company = options[:company]
      @host = "https://#{@company}.supportbee.com"
      @auth_token = options[:auth_token]
      @conn = Faraday.new(:url => @host) do |faraday|
        faraday.params[:auth_token] = @auth_token
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

    def request(url, options = {})
      method = options[:method].nil? ? :get : options[:method]
      response = @conn.run_request(method, url, options[:body], options[:headers])
      JSON.parse(response.body) 
    end

  end
end
