module Omniship
  module FedEx
    module Track
      class Shipment < Omniship::Base
        def packages
          @packages ||= root.map { |results| Package.new(results['trackResults'].first) }
        end

        def scheduled_delivery
          packages.detect { |package| !package.delivery_dates.nil? }&.delivery_dates
        end

        def delivered_at
          packages.detect { |package| !package.delivered_at.nil? }&.delivered_at
        end

        def proof_of_delivery
          packages.detect { |package| !package.proof_of_delivery.nil? }&.proof_of_delivery
        end
      end
    end
  end
end
