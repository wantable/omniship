module Omniship
  module UPS
    module Track
      class Address < Omniship::Base
        def city
          @root['city']
        end

        def state
          @root['stateProvince']
        end

        def country
          @root['country']
        end

        def postal_code
          @root['postalCode']
        end

        def to_s
          "#{city}, #{state} #{postal_code} #{country}"
        end
      end
    end
  end
end
