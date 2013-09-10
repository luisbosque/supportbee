module Supportbee
  class Client
    module Tickets
      
      def tickets()
        response = @conn.get '/tickets.json'
        JSON.parse(response.body)
      end

      def ticket(id)
        response = @conn.get "/tickets/#{id}.json"
        JSON.parse(response.body)
      end

    end
  end
end
