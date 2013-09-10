module Supportbee
  class Client
    module Agents
      
      def agents(extra_parameters = {})
        index('users', extra_parameters) 
      end

      def agent(id)
        response = @conn.get "/users/#{id}.json"
        JSON.parse(response.body)
      end
    end
  end
end
