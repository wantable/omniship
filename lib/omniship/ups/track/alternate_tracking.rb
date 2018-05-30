module Omniship
  module UPS
    module Track
      class AlternateTracking < Omniship::Base

        PACKAGE_ID = 'P'
        MANIFEST_ID = 'S'
        MMS_NUMBER = 'T'
        POSTAL_SERVICE_TRACKING_ID = 'Q'

        def type
          if @root.is_a? String # must be surepost
            POSTAL_SERVICE_TRACKING_ID
          else
            @root.xpath('Type').text
          end
        end

        def value
          if @root.is_a? String
            @root
          else
            @root.xpath('Value').text
          end
        end
      end
    end
  end
end
