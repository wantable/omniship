module Omniship
  module PitneyBowes
    module Track
      class Activity < Omniship::Base
        def address
          @address ||= Address.new(root.slice('eventCity', 'eventStateOrProvince', 'postalCode', 'country'))
        end

        def status
          root['packageStatus']
        end

        def code
          root['standardizedEventCode']
        end

        def timestamp
          date, time, offset = root.values_at('eventDate', 'eventTime', 'eventTimeOffset')

          return if date.nil? || date.empty?

          Omniship::PitneyBowes.parse_timestamp(date, time, offset)
        end
      end
    end
  end
end
