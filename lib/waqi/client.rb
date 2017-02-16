require 'json'
require 'waqi/services'

module Waqi
  class Client
    def initialize(token:)
      @token = token
    end

    def city_feed(city_name)
      service = Service::City.new(city_name)
      response = service.get(token: @token)
      StationData.parse(response)
    end

    def geo_feed(lat, lon)
      service = Service::Geolocation.new(lat,lon)
      response = service.get(token: @token)
      StationData.parse(response)
    end

    def local_feed
      response = Service::City.new().get(token: @token)
      StationData.parse(response)
    end
  end
end
