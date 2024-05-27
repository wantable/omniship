module Omniship
  module UPS
    module Track
      class Shipment < Omniship::Base
        def initialize(root)
          super(root)

          raise Error.new(404, @root['warnings']) if @root.key?('warnings')
        end

        def packages
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
