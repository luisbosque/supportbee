module Supportbee
  class Client
    module WebHooks
      
      def web_hooks(extra_parameters = {})
        index('web_hooks', extra_parameters) 
      end

    end
  end
end
