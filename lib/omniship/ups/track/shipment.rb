module Omniship
  module UPS
    module Track
      class Shipment < Omniship::Base
        def packages
          return [] unless @root.key?('package')

          @packages ||= @root['package'].map do |package|
            Package.new(package)
          end
        end

        def scheduled_delivery
          date = packages.flat_map(&:delivery_dates).first

          Omniship::UPS.parse_timestamp(date) if date && !date.empty?
        end

        def delivered_at
          packages.map(&:delivered_at).compact.first
        end

        def proof_of_delivery
          packages.map(&:proof_of_delivery).compact.first
        end
      end
    end
  end
end
