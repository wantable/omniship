module Omniship
  module Amazon
    module Track
      class Package < Omniship::Base
        # https://developer-docs.shipping.amazon.com/apis/docs/shipping-api-v2-reference#eventcode
        HAS_LEFT_CODES = %w[Departed OutForDelivery ArrivedAtCarrierFacility PickupDone PackageReceivedByCarrier].freeze

        HAS_ARRIVED_CODES = %w[Delivered AvailableForPickup].freeze

        def tracking_number
          root['trackingId']
        end

        def activity
          @activity ||= root['eventHistory'].map do |event|
            Activity.new(event)
          end
        end

        # this is actually an indicator that the the package has been scanned by Amazon ANYWHERE
        def has_left?
          has_arrived? ||
            activity.any? { |a| HAS_LEFT_CODES.include?(a.code) }
        end

        # delivered or ready for pickup at post office, or Notice Left
        def has_arrived?
          activity.any? { |a| HAS_ARRIVED_CODES.include?(a.code) }
        end

        def scheduled_delivery
          Omniship::Amazon.parse_timestamp(root['promisedDeliveryDate']) ||
            delivered_at
        end

        # actual delivery timestamp, distinct from the promised/estimated date
        def delivered_at
          return unless has_arrived?

          activity.find { |a| HAS_ARRIVED_CODES.include?(a.code) }&.timestamp
        end

        def alternate_tracking
          root['alternateLegTrackingId']
        end

        def proof_of_delivery
          pod = root.dig('summary', 'proofOfDelivery')
          return if pod.nil? || pod.empty?

          @proof_of_delivery ||= ProofOfDelivery.new(pod)
        end

        def delivery_image_url
          proof_of_delivery&.delivery_image_url
        end
      end
    end
  end
end
