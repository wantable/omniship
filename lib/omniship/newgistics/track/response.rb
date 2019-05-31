module Omniship
  module Newgistics
    module Track
      class Response < Omniship::Base

        def shipment
          Shipment.new(@root)
        end

        def has_left?
          shipment.packages.length > 0 && shipment.packages.any?(&:has_left?)
        end

        def has_arrived?
          shipment.packages.length > 0 && shipment.packages.any?(&:has_arrived?)
        end
      end
    end
  end
end