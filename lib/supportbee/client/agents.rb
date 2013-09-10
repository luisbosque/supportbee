module Supportbee
  class Client
    module Agens
      
      def agents()
        response = @conn.get '/users.json'
        JSON.parse(response.body)
      end

      def agent(id)
        response = @conn.get "/users/#{id}.json"
        JSON.parse(response.body)
      end
    end
  end
end
