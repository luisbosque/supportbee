require_relative 'client/tickets.rb'
require_relative 'client/agents.rb'
require_relative 'client/groups.rb'
require 'json'

module Supportbee
  class Client

    include Supportbee::Client::Tickets
    include Supportbee::Client::Agents
    include Supportbee::Client::Groups

    def initialize(options={})
      @company = options[:company]
      @host = "https://#{@company}.supportbee.com"
      @auth_token = options[:auth_token]
      @conn = Faraday.new(:url => @host) do |faraday|
        faraday.params[:auth_token] = @auth_token
        faraday.request  :url_encoded             # form-encode POST params
        if options[:debug]
          faraday.response :logger                  # log requests to STDOUT
        end
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

    def request(url, options = {})
      method = options[:method].nil? ? :get : options[:method]
      response = @conn.run_request(method, url, options[:body], options[:headers])
      JSON.parse(response.body) 
    end

    def index(model, extra_parameters = {})
      items = []
      current_page = 1
      last_page = false
      until last_page
        extra_parameters['page'] = current_page
        raw_response = @conn.get do |req|
          req.url "/#{model}.json"
          req.params.merge!(extra_parameters)
        end
        response = JSON.parse(raw_response.body)
        items.concat(response[model])
        if response['current_page'].to_i >= response['total_pages'].to_i
          last_page = true
        else
          current_page = current_page + 1
        end
      end
      items
    end

  end
end
