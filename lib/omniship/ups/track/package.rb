module Omniship
  module UPS
    module Track
      class Package < Omniship::Base
        DEPARTURE_CODE = "I"
        ARRIVAL_CODE = "D"

        def tracking_number
          @root.xpath('TrackingNumber/text()').to_s
        end

        def activity
          @root.xpath('Activity').map do |act|
            Activity.new(act)
          end
        end

        def alternate_tracking
          if !@root.xpath('PackageServiceOptions/USPSPICNumber').empty?
            # surepost
            path = @root.xpath('PackageServiceOptions/USPSPICNumber').text
            puts "USPSPICNumber #{path}"
          else
            # mail innovations
            path = @root.xpath('AlternateTrackingInfo')
            puts "non USPSPICNumber = #{path.to_xml.inspect}"
          end

          AlternateTracking.new(path) if !path.empty?
        end

        def has_left?
          activity.any? {|activity| activity.code == DEPARTURE_CODE }
        end

        def has_arrived?
          activity.any? {|activity| activity.code == ARRIVAL_CODE && !activity.status.include?("transferred to post office")}
        end
      end
    end
  end
end
