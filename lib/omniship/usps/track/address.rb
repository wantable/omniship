module Omniship
  module USPS
    module Track
      class Address < Omniship::Base
        def city
          root['eventCity']
        end

        def state
          root['eventState']
        end

        def country
          root['eventCountry']
        end

        def postal_code
          root['eventZIP']
        end

        def to_s
         "#{city}, #{state} #{postal_code} #{country}".strip
        end
      end
    end
  end
end
