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
      end
    end
  end
end
