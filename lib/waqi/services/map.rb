module Waqi
  module Service
    class Map < Base
      def initialize(bounds)
        super(latlng: bounds)
      end

      def path
        '/map/bounds/'
      end
    end
  end
end
