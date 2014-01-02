module Supportbee
  class Client
    module Tickets
      
      def tickets(extra_parameters = {})
        # Default parameters according to 
        # https://developers.supportbee.com/api
        if extra_parameters['archived'].nil?
          extra_parameters['archived'] = false
        end
        if extra_parameters['spam'].nil?
          extra_parameters['spam'] = false
        end
        if extra_parameters['trash'].nil?
          extra_parameters['trash'] = false
        end
        tickets = index('tickets', extra_parameters) 
        # Dirty trick to avoid getting wrong tickets in case the API doesn't
        # honor some parameters
        known_filters = ['spam', 'trash', 'archived']
        filters = extra_parameters.select do |p| 
          known_filters.include?(p)
        end
        tickets.select do |t|
          !filters.map {|k,v| t[k].to_s == v.to_s}.include?(false)
        end
      end

      def ticket(id)
        response = @conn.get "/tickets/#{id}.json"
        JSON.parse(response.body)
      end

    end
  end
end
