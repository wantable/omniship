module Omniship
  module PitneyBowes
    module Track
      class Shipment < Omniship::Base
        def packages
          @packages ||= [Package.new(root)]
        end

        def scheduled_delivery
          return if root['estimatedDeliveryDate'].nil? || root['estimatedDeliveryDate'].empty?

          date = root['estimatedDeliveryDate']
          time = root['estimatedDeliveryTime']
          offset = root['estimatedDeliveryTimeOffset']

          Omniship::PitneyBowes.parse_timestamp(date, time, offset)
        end
      end
    end
  end
end
