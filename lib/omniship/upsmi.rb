require 'omniship/ups/track'

module Omniship
  module UPSMI
    LABEL = "UPS MI"
    TRACKING_REGEX = [/^\d{18}$/, /MI.*/]

    def self.tracking_test?(tracking)
      TRACKING_REGEX.any?{|regex| tracking =~ regex }
    end

    def self.track(id, bearer_token: nil, options: {})
      UPS::Track::Request.track(id, true)
    end

    def self.tracking_url(number)
      UPS.tracking_url(number)
    end

    def self.bearer_token_required?
      false
    end
  end
end
