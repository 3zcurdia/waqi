module Waqi
  class StationData
    attr_reader :aqi, :idx, :uid, :station, :dominant_pollution, :weather_condition, :timestamp
    def self.parse(data)
      wheather_condition = data[:iaqi] ? WeatherCondition.new(data[:iaqi]) : {}
      station = data[:station] ? Station.parse(data[:station]) : Station.parse(data)
      new(
        aqi: data[:aqi],
        idx: data[:idx],
        uid: data[:uid],
        dominant_pollution: data[:dominentpol],
        station: station,
        weather_condition: wheather_condition,
        timestamp: DateTime.parse("#{data[:time][:s] || data[:time][:stime]}#{data[:time][:tz]}")
      )
    end

    def initialize(args = {})
      @aqi = args[:aqi]
      @idx = args[:idx]
      @uid = args[:uid]
      @station = args[:station]
      @dominant_pollution = args[:dominant_pollution]
      @weather_condition = args[:weather_condition]
      @timestamp = args[:timestamp]
    end
  end
end
