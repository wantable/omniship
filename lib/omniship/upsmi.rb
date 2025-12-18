require 'omniship/ups/track'

module Omniship
  module UPSMI
    LABEL = "UPS MI".freeze
    TRACKING_REGEX = [/^\d{18}$/, /MI.*/]

    def self.tracking_test?(tracking)
      TRACKING_REGEX.any?{|regex| tracking =~ regex }
    end

    def self.track(id, access_token: nil, options: {})
      UPS::Track::Request.track(id, true)
    end

    def self.tracking_url(number)
      UPS.tracking_url(number)
    end

    def self.access_token_required?
      false
    end
  end
end
