require 'omniship/dhlgm/track'

module Omniship
  module DHL
    LABEL = "DHL".freeze
    TRACKING_REGEX = /^\d{10,11}$/
    TRACKING_URL = "http://www.dhl.com/content/g0/en/express/tracking.shtml?brand=DHL&AWB=".freeze

    def self.tracking_test?(tracking)
      tracking =~ TRACKING_REGEX
    end

    def self.track(tracking, access_token: nil, options: {})
      Track::Request.track(tracking)
    end

    def self.tracking_url(number)
      TRACKING_URL + number
    end

    def self.access_token_required?
      false
    end
  end
end
