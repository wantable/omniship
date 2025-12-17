module Omniship
  module Amazon
    module Track
      class Activity < Omniship::Base
        def address
          Address.new(root['location'])
        end

        def status
          root['eventCode']
        end

        def code
          root['eventCode']
        end

        def timestamp
          return if root['eventTime'].nil? || root['eventTime'].length == 0

          Omniship::Amazon.parse_timestamp(root['eventTime'])
        end
      end
    end
  end
end
