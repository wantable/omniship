module Omniship
  module Amazon
    module Track
      class Error < TrackError
        def initialize(errors)
          super(errors)
        end
      end
    end
  end
end
