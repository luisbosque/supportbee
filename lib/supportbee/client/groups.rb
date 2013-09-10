module Supportbee
  class Client
    module Groups
      
      def groups()
        response = @conn.get '/groups.json'
        JSON.parse(response.body)
      end

    end
  end
end
