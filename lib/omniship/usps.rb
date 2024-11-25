require 'omniship/usps/track'

module Omniship
  module USPS
    LABEL = "USPS"
    TRACKING_REGEX = [/\b(91\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d|91\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d\d\d)\b/i, 
                      /^E\D{1}\d{9}\D{2}$|^9\d{15,21}$/, 
                      /^(91|92)[0-9]+$/, 
                      /^[A-Za-z]{2}[0-9]+US$/]

    TRACKING_URL = "https://tools.usps.com/go/TrackConfirmAction?tLabels="
    TIMESTAMP_FORMAT = "%B %d, %Y %I:%M %p"

    class << self
      attr_accessor :client_id
      attr_accessor :client_secret
      attr_accessor :client_ip
      attr_accessor :test
    end

    def self.tracking_test?(tracking)
      TRACKING_REGEX.any? { |regex| tracking =~ regex }
    end
    
    def self.track(id, options = {})
      Track::Request.track(id, options)
    end

    def self.tracking_url(number)
      TRACKING_URL + number
    end

    # <EventTime>7:09 am</EventTime>
    # <EventDate>January 17, 2017</EventDate>
    def self.parse_timestamp(date, time="12:00 am")
      return if date.nil? || date.length == 0

      date_string = date
      date_string += " #{time}" if !time.nil? && time.length > 0
      Time.strptime(date_string, TIMESTAMP_FORMAT)
    end
  end
end
