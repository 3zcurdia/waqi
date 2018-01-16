# frozen_string_literal: true

module Waqi
  module Service
    class Geolocation < Base
      def initialize(lat, lon)
        super()
        @lat = lat
        @lon = lon
      end

      def path
        "/feed/geo:#{@lat};#{@lon}/"
      end
    end
  end
end
