# frozen_string_literal: true

require 'waqi/services'

module Waqi
  class Client
    def initialize(token:)
      @token = token
    end

    def station_feed(station_id)
      response = Service::Station.new(station_id).get(token: @token)
      StationData.parse(response)
    end

    def city_feed(city_name)
      response = Service::City.new(city_name).get(token: @token)
      StationData.parse(response)
    end

    def geo_feed(lat, lon)
      response = Service::Geolocation.new(lat, lon).get(token: @token)
      StationData.parse(response)
    end

    def local_feed
      response = Service::City.new.get(token: @token)
      StationData.parse(response)
    end

    def map_stations(*bounds)
      response = Service::Map.new(*bounds).get(token: @token)
      response.map { |data| StationPin.parse(data) }
    end

    def search(keyword)
      response = Service::Search.new(keyword).get(token: @token)
      response.map { |data| StationData.parse(data) }
    end
  end
end
