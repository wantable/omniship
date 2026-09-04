module Omniship
  module UPS
    module Track
      # Wraps the package deliveryInformation. The signature image and POD
      # content are only populated when proof of delivery is enabled on the
      # shipper account, so they are frequently absent.
      class ProofOfDelivery < Omniship::Base
        def received_by
          present(root['receivedBy'])
        end

        def location
          present(root['location'])
        end

        def signature_image
          present(root.dig('signature', 'image'))
        end

        def pod_content
          present(root.dig('pod', 'content'))
        end

        private

        # the UPS API uses the literal string "null" for absent values
        def present(value)
          value unless value.nil? || value.empty? || value == 'null'
        end
      end
    end
  end
end
