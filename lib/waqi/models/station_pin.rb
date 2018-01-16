# frozen_string_literal: true

module Waqi
  class StationPin < Struct.new(:lat, :lon, :uid, :aqi)
    def self.parse(hash)
      new(*hash.values_at(*members))
    end
  end
end
