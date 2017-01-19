module Omniship
  module Landmark
    module Track
      class Shipment
        
        def initialize(root)
          @root = root
        end
        def packages
          @root.xpath("TrackResponse/Result/Packages/Package").map do |package|
            Package.new(package)
          end
        end

        def scheduled_delivery
         packages.first.scheduled_delivery
        end
      end
    end
  end
end
