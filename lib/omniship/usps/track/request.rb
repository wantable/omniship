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

            if response.key?('errors') || response.key?('error') || !response['success']
              raise Error.new(response)
            end

            Response.new(response)
          end

          private

          # https://developer.usps.com/trackingv3#tag/Resources/operation/get-package-tracking
          def track_shipment(tracking_number, options)
            url = endpoint + TRACK_PATH + tracking_number

            payload = {}
            payload[:expand] = options[:expand] || 'SUMMARY'
            payload[:destinationZIPCode] = options[:destination_zip_code] if options.key?(:destination_zip_code)
            payload[:mailingDate] = options[:mailing_date] if options.key?(:mailing_date)

            headers = {
              'Authorization' => "Bearer #{options[:bearer_token]}",
              accept: :json,
              'Content-Type' => 'application/json; charset=UTF-8'
            }

            if options.key?(:forwarded_for_ip)
              headers['X-Forwarded-For'] = options[:forwarded_for_ip]
            end

            if Omniship.debug
              puts url
              puts 'Headers:'
              puts headers.to_json
              puts 'Payload:'
              puts payload.to_json
            end

            raw_response = RestClient::Request.execute(
              method: :get,
              url: url,
              content_type: 'application/json',
              accept: 'application/json',
              timeout: Omniship.track_timeout,
              open_timeout: Omniship.track_timeout,
              headers: headers,
              payload: payload.to_json
            )

            puts raw_response&.body if Omniship.debug

            JSON.parse(raw_response.body)
          rescue RestClient::NotFound, RestClient::BadRequest => e
            parse_response_for_error(e.response.body)
          rescue RestClient::Unauthorized => e
            parse_unauthorized_response(e.response.body)
          end

          def parse_unauthorized_response(raw_response)
            response = JSON.parse(raw_response)

            return e if !response.key?('error_description') && !response.key?('error')

            if response.key?('error_description')
              response['error_description']
            else
              response.dig('error', 'message')
            end
          end

          def parse_response_for_error(response)
            JSON.parse(response)
          rescue StandardError
            {'error' => 'Cannot track Package'}
          end
        end
      end
    end
  end
end
