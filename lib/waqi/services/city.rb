module Waqi
  module Service
    class City < Base
      def initialize(name = 'here')
        super()
        @name = name
      end

      def path
        "/feed/#{@name}/"
      end
    end
  end
end
