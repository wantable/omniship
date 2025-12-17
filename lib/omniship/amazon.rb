require 'omniship/amazon/track'

module Omniship
  module Amazon
    LABEL = 'Amazon'.freeze
    TRACKING_REGEX = []

    TRACKING_URL = 'N/A'.freeze

    class << self
      attr_accessor :test
    end

    def self.tracking_test?(tracking)
      TRACKING_REGEX.any? { |regex| tracking =~ regex }
    end

    def self.track(id, access_token:, options: {})
      Track::Request.track(id, access_token, options)
    end

    # TODO: Amazon does not have a website for ShippingPartner Tracking
    def self.tracking_url(number)
      nil
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
