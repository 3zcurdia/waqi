module Waqi
  class StationData
    attr_reader :aqi, :idx, :station, :dominant_pollution, :weather_condition, :timestamp
    def self.parse(data)
      new(
        aqi: data[:aqi],
        idx: data[:idx],
        dominant_pollution: data[:dominentpol],
        station: Station.parse(data),
        weather_condition: WeatherCondition.new(data[:iaqi]),
        timestamp: DateTime.parse("#{data[:time][:s]}#{data[:time][:tz]}")
      )
    end

    def initialize(aqi: nil, idx: nil, station: nil, dominant_pollution: nil, weather_condition: nil, timestamp: nil)
      @aqi = aqi
      @idx = idx
      @station = station
      @dominant_pollution = dominant_pollution
      @weather_condition = weather_condition
      @timestamp = timestamp
    end
  end
end
