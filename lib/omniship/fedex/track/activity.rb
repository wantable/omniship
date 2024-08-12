module Omniship
  module FedEx
    module Track
      class Activity < Omniship::Base
        def address
          @address ||= Address.new(root['scanLocation'])
        end

        def status
          root['derivedStatus']
        end

        def code
          root['derivedStatusCode']
        end

        def timestamp
          datetime = root['date']

          return if datetime.nil? || datetime.empty?

          Omniship::FedEx.parse_timestamp(datetime, offset: true)
        end
      end
    end
  end
end
