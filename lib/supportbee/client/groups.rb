module Supportbee
  class Client
    module Groups
      
      def groups(extra_parameters = {})
        index('groups', extra_parameters) 
      end

    end
  end
end
