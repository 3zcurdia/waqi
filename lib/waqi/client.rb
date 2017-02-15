require 'json'

module Waqi
  class Client
    def initialize(token:)
      @token = token
    end

    def city_feed(city_name)
      service = Service.new(city_name: city_name)
      response = service.get(token: @token)
      StationData.parse(response)
    end

    def geo_feed(lat, lon)
      service = Service.new(lat: lat, lon: lon)
      response = service.get(token: @token)
      StationData.parse(response)
    end
  end
end
