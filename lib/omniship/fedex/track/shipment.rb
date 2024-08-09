module Omniship
  module Fedex
    module Track
      class Shipment < Omniship::Base
        def packages
          @packages ||= root.map { |results| Package.new(results['trackResults']) }
        end

        def scheduled_delivery
          packages.detect { |package| package.delivery_dates.present? }&.delivery_dates
        end
      end
    end
  end
end
