module Omniship
  module PitneyBowes
    module Track
      class Package < Omniship::Base
        # https://www.docs.pitneybowes.com/document/standardized-tracking-event-code-list
        DELIVERED = 'Delivered'.freeze
        LEFT_STATUSES = %w[InTransit OutForDelivery PickedUp].freeze

        def tracking_number
          root['trackingNumber']
        end

        def activity
          @activity ||= root['scanDetailsList'].map do |act|
            Activity.new(act)
          end
        end

        def has_left?
          activity.any? { |activity| LEFT_STATUSES.include?(activity.status) }
        end

        def has_arrived?
          activity.any? { |activity| activity.status == DELIVERED }
        end

        # handled in shipment.rb
        def delivery_dates; end

        # not supported yet
        def alternate_tracking; end
      end
    end
  end
end
