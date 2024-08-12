module Omniship
  module FedEx
    module Track
      class Package < Omniship::Base
        # https://developer.fedex.com/api/en-us/guides/api-reference.html#trackingstatuscodes
        DELIVERED = 'DL'.freeze
        # Picked up
        # Left FedEx origin facility
        # Arrived at FedEx location
        LEFT_CODES = %w[PU DP AR].freeze

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
          return if root.key?('estimatedDeliveryTimeWindow')

          window = root.dig('estimatedDeliveryTimeWindow', 'window', 'begins')

          return if window.nil? || window.empty?

          Omniship::FedEx.parse_timestamp(window)
        end

        def alternate_tracking; end
      end
    end
  end
end
