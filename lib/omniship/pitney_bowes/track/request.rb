module Omniship
  module PitneyBowes
    module Track
      class Request
        ERROR_RESPONSE = 0

        TEST_URL = 'https://shipping-api-sandbox.pitneybowes.com/'
        LIVE_URL = 'https://shipping-api.pitneybowes.com/'

        TOKEN_PATH = 'oauth/token'
        TRACK_PATH = 'shippingservices/v1/tracking/'

        def self.base_url
          if PitneyBowes.test == true
            TEST_URL
          else
            LIVE_URL
          end
        end

        def self.track(tracking_number)
          raw_response = get_response(tracking_number)

          response = JSON.parse(raw_response.body)

          if Omniship.debug
            puts raw_response.code
            puts response.inspect
          end

          unless response.dig('response', 'errors').nil?
            raise Error.new(raw_response.code, response.dig('response', 'errors'))
          end

          Response.new(response)
        end

        private

        def self.oauth_client_credentials
          if @oauth_client_credentials && @oauth_client_credentials[:expires_at] > Time.zone.now.to_i
            return @oauth_client_credentials[:access_token]
          end

          raw_response = RestClient::Request.execute(
            method: :post,
            url: base_url + TOKEN_PATH,
            headers: {
              content_type: 'application/x-www-form-urlencoded',
              Authorization: "Basic <#{base64_oauth_creds}>"
            },
            payload: {
              grant_type: 'client_credentials'
            },
            timeout: Omniship.track_timeout,
            open_timeout: Omniship.track_timeout
          )

          puts raw_response if Omniship.debug

          response = JSON.parse(raw_response.body)

          raise 'PitneyBowes TOKEN REQUEST NOT APPROVED' if raw_response.code != 200

          @oauth_client_credentials = {
            access_token: response.fetch('access_token'),
            expires_at: Time.now.to_i + response.fetch('expiresIn').to_i - 5 # request new token 5 seconds before expiration
          }

          @oauth_client_credentials[:access_token]
        end

        def self.base64_oauth_creds
          Base64.strict_encode64("#{PitneyBowes.api_key}:#{PitneyBowes.api_secret}")
        end

        def self.get_response(tracking_number)
          tracking_url = base_url + TRACK_PATH + tracking_number

          puts tracking_url if Omniship.debug

          RestClient::Request.execute(
            method: :get,
            headers: {
              'Authorization' => "Bearer #{oauth_client_credentials}",
              accept: :json,
              'Content-Type' => 'application/json; charset=UTF-8',
              params: {
                carrier: 'PBCS',
                packageIdentifierType: 'TrackingNumber'
              }
            },
            url: tracking_url,
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
