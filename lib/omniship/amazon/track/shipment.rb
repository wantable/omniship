module Omniship
  module Amazon
    module Track
      class Shipment < Omniship::Base
        def packages
          @packages ||= [Package.new(root)]
        end

        def scheduled_delivery
          packages.find(&:scheduled_delivery)&.scheduled_delivery
        end
      end
    end
  end
end
