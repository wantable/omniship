require 'omniship/fedex/track'

module Omniship
  module FedEx
    LABEL = 'FedEx'.freeze
    TRACKING_REGEX = [/(\b96\d{20}\b)|(\b\d{15}\b)|(\b\d{12}\b)/,
                      /\b((98\d\d\d\d\d?\d\d\d\d|98\d\d) ?\d\d\d\d ?\d\d\d\d( ?\d\d\d)?)\b/,
                      /^[0-9]{15}$/]

    TRACKING_URL = "https://www.fedex.com/fedextrack/?tracknumbers=".freeze
    TIMESTAMP_FORMAT = "%Y-%m-%dT%H:%M:%S"
    TIMESTAMP_FORMAT_WITH_OFFSET = "%Y-%m-%dT%H:%M:%S %z"

    class << self
      attr_accessor :api_key, :api_secret, :test
    end

    def self.tracking_test?(tracking)
      TRACKING_REGEX.any? { |regex| tracking =~ regex }
    end

    def self.tracking_url(number)
      TRACKING_URL + number
    end

    # 2021-10-01T08:00:00
    def self.parse_timestamp(datetime, offset: false)
      return if datetime.nil? || datetime.empty?

      if offset
        Time.strptime(datetime, TIMESTAMP_FORMAT_WITH_OFFSET)
      else
        Time.strptime(datetime, TIMESTAMP_FORMAT)
      end
    end
  end
end
