module Omniship
  module FedEx
    module Track
      class Package < Omniship::Base
        # https://developer.fedex.com/api/en-us/guides/api-reference.html#trackingstatuscodes
        DELIVERED = 'DL'.freeze
        # PU: Picked up
        # DP: Left FedEx origin facility
        # AR: Arrived at FedEx location
        # OD: Out for Delivery
        # IT: In Transit
        LEFT_CODES = %w[PU DP AR OD IT].freeze

        def tracking_number
          root.dig('trackingNumberInfo', 'trackingNumber')
        end

        def activity
          @activity ||= root['scanEvents'].map do |act|
            Activity.new(act)
          end
        end

        def has_left?
          activity.any? { |activity| LEFT_CODES.include?(activity.code) }
        end

        def has_arrived?
          activity.any? { |activity| activity.code == DELIVERED }
        end

        def delivery_dates
          return unless root.key?('estimatedDeliveryTimeWindow')

          window = root.dig('estimatedDeliveryTimeWindow', 'window', 'begins')

          if window.nil? || window.empty?
            dates_and_times = root.dig('dateAndTimes')
            return unless dates_and_times
            estimated_delivery = dates_and_times.detect{|x| ['ACTUAL_DELIVERY', 'ESTIMATED_DELIVERY'].include?(x['type']) }

            return unless estimated_delivery
            window = estimated_delivery['dateTime']
          end

          Omniship::FedEx.parse_timestamp(window)
        end

        def alternate_tracking; end
      end
    end
  end
end
