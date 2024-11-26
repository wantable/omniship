module Omniship
  module USPS
    module Track
      class Request
        TEST_URL = 'https://api-cat.usps.com/'.freeze
        LIVE_URL = 'https://api.usps.com/'.freeze

        TRACK_PATH = 'tracking/v3/tracking/'.freeze

        class << self
          def endpoint
            return TEST_URL if USPS.test == true

            LIVE_URL
          end

          def track(tracking_number, options)
            if options[:bearer_token].nil?
              raise 'Please make sure a bearer_token is passed in via options'
            end

            response = track_shipment(tracking_number, options)

            if response.key?('errors') || response.key?('error') || response['success'] == false
              raise Error.new(response)
            end

            Response.new(response)
          end

          private

          # https://developer.usps.com/trackingv3#tag/Resources/operation/get-package-tracking
          def track_shipment(tracking_number, options)
            url = endpoint + TRACK_PATH + tracking_number

            params = {}
            params[:expand] = options[:expand] || 'DETAIL'
            params[:destinationZIPCode] = options[:destination_zip_code] if options.key?(:destination_zip_code)
            params[:mailingDate] = options[:mailing_date] if options.key?(:mailing_date)

            headers = {
              'Authorization' => "Bearer #{options[:bearer_token]}",
              'Content-Type' => 'application/json',
              accept: :json
            }

            headers['X-Forwarded-For'] = USPS.client_ip unless USPS.client_ip.nil?

            if Omniship.debug
              puts url
              puts 'Headers:'
              puts headers.to_json
              puts 'Params:'
              puts params.to_json
            end

            headers[:params] = params

            raw_response = RestClient::Request.execute(
              method: :get,
              url: url,
              content_type: 'application/json',
              accept: 'application/json',
              timeout: Omniship.track_timeout,
              open_timeout: Omniship.track_timeout,
              headers: headers
            )

            puts raw_response&.body if Omniship.debug

            JSON.parse(raw_response.body)
          rescue RestClient::NotFound, RestClient::BadRequest, RestClient::Unauthorized => e
            parse_response_for_error(e.response.body)
          end

          def parse_response_for_error(response)
            puts response if Omniship.debug
            JSON.parse(response)
          rescue StandardError
            {'error' => 'Cannot track Package'}
          end
        end
      end
    end
  end
end
