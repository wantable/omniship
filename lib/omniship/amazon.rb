require 'omniship/amazon/track'

module Omniship
  module Amazon
    LABEL = 'Amazon'
    TRACKING_REGEX = []

    TRACKING_URL = "TODO"

    class << self
      attr_accessor :test
    end

    def self.tracking_test?(tracking)
      TRACKING_REGEX.any? { |regex| tracking =~ regex }
    end

    def self.track(id, access_token:, options: {})
      Track::Request.track(id, access_token, options)
    end

    def self.tracking_url(number)
      TRACKING_URL + number
    end

    def self.bearer_token_required?
      true
    end

    def self.parse_timestamp(date)
      return if date.nil? || date.length == 0

      Time.parse(date)
    end
  end
end
