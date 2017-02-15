require 'faraday'
require 'json'

module Waqi
  class Client
    def initialize(token:)
      @token = token
    end

    def build(path)
      "#{base_url}#{path}?token=#{@token}"
    end

    def get(path)
      parse_response(Faraday.get(build(path)))
    end

    def city_feed(city_name)
      City.new(self, city_name)
    end

    private

    def base_url
      @base_url ||= 'https://api.waqi.info'.freeze
    end

    def parse_response(response)
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      raise "API Error: #{parsed_response[:message]}" if parsed_response[:status] == 'error'
      parsed_response[:data]
    end
  end
end
