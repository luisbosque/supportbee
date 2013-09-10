module Supportbee
  class Client
    module Snippets
      
      def snippets(extra_parameters = {})
        index('snippets', extra_parameters) 
      end

    end
  end
end
