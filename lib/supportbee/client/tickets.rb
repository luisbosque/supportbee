module Supportbee
  class Client
    module Tickets
      
      def tickets(extra_parameters = {})
        index('tickets', extra_parameters) 
      end

      def ticket(id)
        response = @conn.get "/tickets/#{id}.json"
        JSON.parse(response.body)
      end

    end
  end
end
