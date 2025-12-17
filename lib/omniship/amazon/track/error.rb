module Omniship
  module Amazon
    module Track
      class Error < TrackError
        def initialize(code, errors)
          self.code = code

          super(errors)
        end
      end
    end
  end
end
