module Waqi
  class StationData
    attr_reader :aqi, :idx, :station, :dominant_pollution, :weather_condition, :timestamp

    def initialize(client, city_name: nil, lat: nil, long: nil, ip: nil)
      @client = client
      @path = "/feed/#{city_name}/"
      update!
    end

    def update!
      parse(@client.get(@path))
      self
    end

    private

    def parse(data)
      @aqi = data[:aqi]
      @idx = data[:idx]
      @dominant_pollution = data[:dominentpol]
      @station            = Station.parse(data)
      @weather_condition  = WeatherCondition.new(data[:iaqi])
      @timestamp          = DateTime.parse("#{data[:time][:s]}#{data[:time][:tz]}")
    end
  end
end
