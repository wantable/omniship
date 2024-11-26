module Omniship
  module USPS
    module Track
      class Package < Omniship::Base
        # https://about.usps.com/publications/pub97/pub97_appi.htm
        HAS_LEFT_CODES = [
          "SF", # UNDOCUMENTED but seems to be "Acceptance" (Departed Post Office)
          "03", # Accept or Pickup (by carrier)
          "10", # Processed
          "80", # Picked Up by Shipping Partner
          "81", # Arrived Shipping Partner Facility
          "82", # Departed Shipping Partner Facility
          "16", # Available for Returns Agent
          "MR", # UNDOCUMENTED Picked Up and Processed by Agent
          "OF", # When a mailpiece receives the physical scan “arrival at unit”
          "DX", # If no delivery scan made 14 hours after OF status. (Awaiting Delivery Scan)
          "07", # Arrival at Unit
          "PC"  # Sorting / Processing Complete - After a mailpiece receives the “07 Arrival at Unit” scan
        ].freeze

        HAS_ARRIVED_CODES = [
          "01", # Delivered*
          "17", # Picked Up By Agent, Tendered to Returns Agent
          "MR"  # UNDOCUMENTED Picked Up and Processed by Agent
        ].freeze

        def tracking_number
          root['trackingNumber']
        end

        def activity
          @activity ||= root['trackingEvents'].map do |event|
            Activity.new(event)
          end
        end

        # this is actually an indicator that the the package has been scanned by USPS ANYWHERE
        def has_left?
          has_arrived? ||
            activity.any? { |activity| HAS_LEFT_CODES.include?(activity.code) }
        end

        # delivered or ready for pickup at post office, or Notice Left
        def has_arrived?
          activity.any? { |activity| HAS_ARRIVED_CODES.include?(activity.code) }
        end

        def scheduled_delivery
          Omniship::USPS.parse_timestamp(root['expectedDeliveryTimeStamp'], nil) ||
            Omniship::USPS.parse_timestamp(root['guaranteedDeliveryTimeStamp'], nil)
        end
      end
    end
  end
end
