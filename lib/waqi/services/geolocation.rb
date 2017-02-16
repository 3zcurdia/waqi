module Waqi
  module Service
    class Geolocation < Base
      def initialize(lat, lon)
        super()
        @lat, @lon = lat, lon
      end

      def path
        "/feed/geo:#{@lat};#{@lon}/"
      end
    end
  end
end
