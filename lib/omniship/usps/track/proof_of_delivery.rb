module Omniship
  module USPS
    module Track
      # Wraps the delivered tracking event. USPS v3 tracking does not return a
      # signature image or delivery photo inline (a signature proof of delivery
      # requires a separate USPS request), so only the recipient name that can
      # accompany the delivery scan is exposed here.
      class ProofOfDelivery < Omniship::Base
        def received_by
          value = root['name'] || root['firm']
          value unless value.nil? || value.empty?
        end

        def signed_by
          value = root['name']
          value unless value.nil? || value.empty?
        end
      end
    end
  end
end
