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
      end
    end
  end
end
