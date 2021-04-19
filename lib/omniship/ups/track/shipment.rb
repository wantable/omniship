module Omniship
  module UPS
    module Track
      class Shipment < Omniship::Base

        def packages
          @root.xpath('Package').map do |package|
            Package.new(package)
          end
        end

        def scheduled_delivery
          date = @root.xpath('Package/RescheduledDeliveryDate').text
          date = @root.xpath('ScheduledDeliveryDate').text if date.nil? || date.empty?
          Omniship::UPS.parse_timestamp(date) if date && !date.empty?
        end
      end
    end
  end
end
