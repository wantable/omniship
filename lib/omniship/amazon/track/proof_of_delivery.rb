module Omniship
  module Amazon
    module Track
      class ProofOfDelivery < Omniship::Base
        def delivery_image_url
          root['deliveryImageURL']
        end

        def signature_image_url
          root['signatureImageURL']
        end

        def received_by
          root['receivedBy']
        end
      end
    end
  end
end
