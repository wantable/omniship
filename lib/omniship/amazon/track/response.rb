module Omniship
  module Amazon
    module Track
      class Response < Omniship::Base
        def shipment
          @shipment ||= Track::Shipment.new(root)
        end

        def has_left?
          !shipment.packages.empty? && shipment.packages.all?(&:has_left?)
        end

        def has_arrived?
          !shipment.packages.empty? && shipment.packages.all?(&:has_arrived?)
        end
      end
    end
  end
end
