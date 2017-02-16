module Waqi
  module Service
    class Map < Base
      def initialize(*bounds)
        super(latlng: bounds.take(4).join(','))
      end

      def path
        '/map/bounds/'.freeze
      end
    end
  end
end
