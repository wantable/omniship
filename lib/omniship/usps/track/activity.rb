module Omniship
  module USPS
    module Track
      class Activity < Omniship::Base
        def address
          Address.new(root)
        end

        def status
          root['eventType']
        end

        def code
          root['eventCode']
        end

        def timestamp
          return if root['eventTimestamp'].nil? || root['eventTimestamp'].length == 0

          Omniship::USPS.parse_timestamp(root['eventTimestamp'], nil)
        end
      end
    end
  end
end
