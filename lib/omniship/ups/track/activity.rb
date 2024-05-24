module Omniship
  module UPS
    module Track
      class Activity < Omniship::Base
        def address
          Address.new(@root.dig('location', 'address'))
        end

        def status
          @root.dig('status', 'description')
        end

        def code
          @root.dig('status', 'statusCode').to_s
        end

        def timestamp
          Omniship::UPS.parse_timestamp(@root['date'], @root['time'])
        end
      end
    end
  end
end
