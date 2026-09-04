module Omniship
  module FedEx
    module Track
      # Wraps the trackResult's deliveryDetails. FedEx does not return a
      # delivery image inline (the signature image requires a separate SPOD
      # call with the shipper account number), so only the delivery details
      # that arrive with tracking are exposed here.
      class ProofOfDelivery < Omniship::Base
        def received_by
          root['receivedByName']
        end

        def signed_by
          root['signedByName']
        end

        def location_description
          root['locationDescription']
        end
      end
    end
  end
end
