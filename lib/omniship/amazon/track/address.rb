module Omniship
  module Amazon
    module Track
      class Address < Omniship::Base
        def city
          root&.[]('city')
        end

        def state
          root&.[]('stateOrRegion')
        end

        def country
          root&.[]('countryCode')
        end

        def postal_code
          root&.[]('postalCode')
        end

        def to_s
         "#{city}, #{state} #{postal_code} #{country}".strip
        end
      end
    end
  end
end
