module Omniship
  module USPS
    module Track
      class Error < TrackError
        def initialize(response)
          self.code = find_code(response)

          super(find_message(response))
        end

        def find_message(response)
          return response['message'] if response.key?('message')

          if response.key?('errors') && response['errors'].is_a?(Array) && response['errors'].any?
            return response['errors'].first['message'] || 'Something went wrong'
          end

          return response.dig('error', 'message') unless response.dig('error', 'message').nil?

          'Something went wrong'
        end

        def find_code(response)
          return response['code'] if response.key?('code')

          if response.key?('errors') && response['errors'].is_a?(Array) && response['errors'].any?
            return response['errors'].first['code']
          end

          return response.dig('error', 'code') unless response.dig('error', 'message').nil?

          500
        end
      end
    end
  end
end
