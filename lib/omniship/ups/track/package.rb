module Omniship
  module UPS
    module Track
      class Package < Omniship::Base
        # https://developer.ups.com/api/reference/tracking/api-code?loc=en_US
        DEPARTURE_CODE = "I"
        ARRIVAL_CODE = "D"

        def tracking_number
          @root['trackingNumber']
        end

        def delivery_dates
          @root['deliveryDate'].map { |dd| dd['date'] }
        end

        def activity
          @root['activity'].map do |act|
            Activity.new(act)
          end
        end

        def alternate_tracking
          numbers = @root['AlternateTrackingNumber']

          AlternateTracking.new(numbers.first) unless numbers.empty?
        end

        def has_left?
          activity.any? { |activity| activity.code == DEPARTURE_CODE }
        end

        def has_arrived?
          activity.any? { |activity| activity.code == ARRIVAL_CODE && !activity.status.include?("transferred to post office")}
        end
      end
    end
  end
end
