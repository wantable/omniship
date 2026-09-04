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

        def delivered_at
          packages.find(&:delivered_at)&.delivered_at
        end

        def proof_of_delivery
          packages.find(&:proof_of_delivery)&.proof_of_delivery
        end
      end
    end
  end
end
