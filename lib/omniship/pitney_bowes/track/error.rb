module Omniship
  module PitneyBowes
    module Track
      class Error < TrackError
        # errors are an array of { code: 'string', message: 'string' }
        def initialize(code, errors)
          self.code = NOT_FOUND if code == 404

          super(errors.map { |e| e['message'] }.join(', '))
        end
      end
    end
  end
end
