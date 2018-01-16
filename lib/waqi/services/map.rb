# frozen_string_literal: true

module Waqi
  module Service
    class Map < Base
      def initialize(*bounds)
        super(latlng: bounds.take(4).join(','))
      end

      def path
        '/map/bounds/'
      end
    end
  end
end
