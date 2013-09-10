module Supportbee
  class Client
    module Labels
      
      def labels(extra_parameters = {})
        index('labels', extra_parameters) 
      end

    end
  end
end
