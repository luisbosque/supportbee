module Supportbee
  class Client
    module Tickets
      def tickets()
        response = @conn.get '/tickets.json', { :auth_token => @auth_token }
        JSON.parse(response.body)
      end
    end
  end
end
