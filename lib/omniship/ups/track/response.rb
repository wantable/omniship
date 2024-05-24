module Omniship
  module UPS
    module Track
      class Response < Omniship::Base

        def shipment
          @shipment ||= Track::Shipment.new(@root.dig('trackResponse', 'shipment'))
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
