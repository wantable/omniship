require 'omniship/pitney_bowes/track'

module Omniship
  module PitneyBowes
    LABEL = 'PitneyBowes'.freeze
    TRACKING_REGEX = [/^920[0-9]{23}$/]
    TRACKING_URL = "https://trackpb.shipment.co/track/"
    DATE_FORMAT = "%Y-%m-%d"
    TIMESTAMP_FORMAT = "#{DATE_FORMAT} %H:%M:%S"
    TIMESTAMP_FORMAT_WITH_OFFSET = "#{TIMESTAMP_FORMAT} %z"

    class << self
      attr_accessor :api_key, :api_secret, :test
    end

    def self.tracking_test?(tracking)
      TRACKING_REGEX.any? { |regex| tracking =~ regex}
    end

    def self.track(id, bearer_token: nil, options: {})
      Track::Request.track(id)
    end

    def self.tracking_url(number)
      TRACKING_URL + number
    end

    def self.token_required?
      false
    end

    # <Date>YYYY-MM-DD</Date>
    # <Time>HH:MM:SS </Time>
    # <offset>±hh:mm</offset>
    def self.parse_timestamp(date, time = nil, offset = nil)
      return if date.nil? || date.empty?
      if time.nil? || time.empty?
        Time.strptime("#{date}", DATE_FORMAT)
      elsif offset.nil? || offset.empty?
        Time.strptime("#{date} #{time}", TIMESTAMP_FORMAT)
      else
        Time.strptime("#{date} #{time} #{offset}", TIMESTAMP_FORMAT_WITH_OFFSET)
      end
    end
  end
end
