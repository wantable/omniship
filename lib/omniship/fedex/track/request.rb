module Omniship
  module Fedex
    module Track
      class Request
        TEST_URL = 'https://apis-sandbox.fedex.com/'.freeze
        LIVE_URL = 'https://apis.fedex.com/'.freeze

        # test and live are the same?
        OAUTH_PATH = 'authorization/v1/oauth/token'.freeze
        TRACK_PATH = 'track/v1/trackingnumbers'.freeze

        class << self
          def base_url
            if Fedex.test == true
              TEST_URL
            else
              LIVE_URL
            end
          end

          def track(tracking_number)
            raw_response = get_response(tracking_number)

            response = JSON.parse(raw_response.body)

            if Omniship.debug
              puts raw_response.code
              puts response.inspect
            end

            unless response.key?('errors')
              raise Error.new(raw_response.code, response['errors'])
            end

            Response.new(response.dig('output', 'completeTrackResults'))
          end

          private

          # https://developer.fedex.com/api/en-us/catalog/authorization/v1/docs.html
          def oauth_client_credentials
            if @oauth_client_credentials && @oauth_client_credentials[:expires_at] > Time.now.to_i
              return @oauth_client_credentials[:access_token]
            end

            raw_response = RestClient::Request.execute(
              method: :post,
              url: base_url + OAUTH_PATH,
              headers: {
                content_type: 'application/x-www-form-urlencoded',
              },
              payload: {
                grant_type: 'client_credentials',
                client_id: Fedex.client_id,
                client_secret: Fedex.client_secret
              },
              timeout: Omniship.track_timeout,
              open_timeout: Omniship.track_timeout
            )

            puts raw_response if Omniship.debug

            response = JSON.parse(raw_response.body)

            raise 'Fedex TOKEN REQUEST NOT APPROVED' if raw_response.code != 200

            @oauth_client_credentials = {
              access_token: response.fetch('access_token'),
              expires_at: Time.now.to_i + response.fetch('expires_in').to_i - 5 # request new token 5 seconds before expiration
            }

            @oauth_client_credentials[:access_token]
          end

          def get_response(tracking_number)
            puts tracking_url if Omniship.debug

            RestClient::Request.execute(
              method: :post,
              headers: {
                'Authorization' => "Bearer #{oauth_client_credentials}",
                'x-customer-transaction-id' => SecureRandom.uuid,
                'x-locale' => 'en_US',
                'Content-Type' => 'application/json',
                accept: :json
              },
              url: base_url + TRACK_PATH,
              payload: {
                includeDetailedScans: true,
                trackingInfo: [
                  {
                    trackingNumberInfo: { trackingNumber: tracking_number }
                  }
                ]
              },
              content_type: 'application/json',
              accept: 'application/json',
              timeout: Omniship.track_timeout,
              open_timeout: Omniship.track_timeout
            )
          rescue RestClient::Unauthorized => e
            e.response
          end
        end
      end
    end
  end
end
