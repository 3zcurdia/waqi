module Waqi
  class StationPin < Struct.new(:lat, :lon, :uid, :aqi)
    def self.parse(hash)
      new(*hash.values_at(*self.members))
    end
  end
end
