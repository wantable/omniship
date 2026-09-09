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
          ts = root['eventTimestamp']
          return if ts.nil? || ts.length == 0

          offset = root['GMTOffset']
          ts = "#{ts}#{offset}" if offset && offset.length > 0

          Omniship::USPS.parse_timestamp(ts, nil)
        end
      end
    end
  end
end
