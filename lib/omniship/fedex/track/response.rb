module Omniship
  module FedEx
    module Track
      class Response < Omniship::Base
        # https://developer.fedex.com/api/en-us/catalog/track/v1/docs.html#operation/Track%20by%20Tracking%20Number
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
