module Waqi
  class City
    attr_reader :name, :geo, :web_url, :aqi, :idx, :attributions,
                :dominant_pollution, :weather_condition, :timestamp

    def initialize(client, city_name)
      @client = client
      @feed_path = "/feed/#{city_name}/"
      update!
    end

    def update!
      parse(@client.get(@feed_path))
      self
    end

    private

    def parse(data)
      @aqi = data[:aqi]
      @idx = data[:idx]
      @name = data[:city][:name]
      @geo = data[:city][:geo]
      @web_url = data[:city][:url]
      @attributions = data[:attributions].map { |a| Attribution.parse(a) }
      @dominant_pollution = data[:dominentpol]
      @weather_condition = WeatherCondition.new(data[:iaqi])
      @timestamp = DateTime.parse("#{data[:time][:s]}#{data[:time][:tz]}")
    end
  end
end
