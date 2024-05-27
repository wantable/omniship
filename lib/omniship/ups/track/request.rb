module Omniship
  module UPS
    module Track
      class Request
        ERROR_RESPONSE = 0

        TEST_URL = 'https://wwwcie.ups.com/'
        LIVE_URL = 'https://onlinetools.ups.com/'

        TOKEN_PATH = 'security/v1/oauth/token'
        TRACK_PATH = 'api/track/v1/details/'

        def self.endpoint
          if UPS.test == true
            TEST_URL
          else
            LIVE_URL
          end
        end

        # https://developer.ups.com/api/reference?loc=en_US#operation/getSingleTrackResponseUsingGET
        def self.track(tracking_number, mail_innovations=false)
          raw_response = get_response(tracking_number)

          response = JSON.parse(raw_response.body)

          if Omniship.debug
            puts raw_response.code
            puts response.inspect
          end

          if response['response'].key?('errors')
            raise Error.new(raw_response.code, response.dig('response', 'errors'))
          end

          Response.new(response)
        end

        private

        def self.oauth_client_credentials
          if @oauth_client_credentials && oauth_client_credentials[:expires_at] > Time.zone.now.to_i
            return @oauth_client_credentials[:access_token]
          end

          raw_response = RestClient::Request.execute(
            method: :post,
            url: endpoint + TOKEN_PATH,
            user: UPS.client_id,
            password: UPS.client_secret,
            payload: { "grant_type" => 'client_credentials' },
            content_type: 'application/json',
            accept: 'application/json',
            timeout: Omniship.track_timeout,
            open_timeout: Omniship.track_timeout
          )

          puts raw_response if Omniship.debug

          response = JSON.parse(raw_response.body)

          raise 'UPS TOKEN REQUEST NOT APPROVED' if response['status'] != 'approved'

          @oauth_client_credentials = {
            access_token: response.fetch('access_token'),
            expires_at: Time.now.to_i + response.fetch('expires_in').to_i - 5 # request new token 5 seconds before expiration
          }

          @oauth_client_credentials[:access_token]
        end

        def self.transaction_src
          if UPS.test
            "Testing #{UPS.source}"
          else
            UPS.source
          end
        end

        def self.get_response(tracking_number)
          tracking_url = endpoint + TRACK_PATH + tracking_number

          puts tracking_url if Omniship.debug

          transaction_id = SecureRandom.uuid

          RestClient::Request.execute(
            method: :get,
            headers: {
               'Authorization' => "Bearer #{oauth_client_credentials}",
               'transId' => SecureRandom.uuid,
               'transactionSrc' => transaction_src,
              accept: :json,
              'Content-Type' => 'application/json; charset=UTF-8'
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
