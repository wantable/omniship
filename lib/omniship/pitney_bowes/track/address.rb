module Omniship
  module PitneyBowes
    module Track
      class Address < Omniship::Base
        def city
          root['eventCity']
        end

        def state
          root['eventStateOrProvince']
        end

        def country
          root['country']
        end

        def postal_code
          root['postalCode']
        end

        def to_s
          "#{city}, #{state} #{postal_code} #{country}"
        end
      end
    end
  end
end
