module Omniship
  module Amazon
    module Track
      class Request
        TEST_URL = 'https://sandbox.sellingpartnerapi-na.amazon.com/'.freeze
        LIVE_URL = 'https://sellingpartnerapi-na.amazon.com/'.freeze

        TRACK_PATH = 'shipping/v2/tracking'.freeze

        class << self
          def endpoint
            return TEST_URL if Amazon.test == true

            LIVE_URL
          end

          def track(tracking_number, access_token, options)
            options ||= {}

            raise 'access_token is required' if access_token.nil?

            response = track_shipment(tracking_number, access_token, options)

            if response.key?('errors') || response.key?('error') || response['success'] == false
              raise Error.new(response)
            end

            Response.new(response['payload'])
          end

          private

          # https://developer.usps.com/trackingv3#tag/Resources/operation/get-package-tracking
          def track_shipment(tracking_number, access_token, options)
            url = endpoint + TRACK_PATH
            params = {}
            params[:trackingId] = tracking_number
            params[:carrierId] = options[:carrier_id] || 'AMZN_US'

            headers = {
              'x-amz-access-token'          => access_token,
              'x-amzn-shipping-business-id' => 'AmazonShipping_US',
              'Content-Type'                => 'application/json',
              accept: :json
            }

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
