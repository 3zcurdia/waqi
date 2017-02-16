require 'faraday'
require 'json'
module Waqi
  class Service
    BASE_URL = 'https://api.waqi.info'.freeze

    def initialize(city_name: nil, lat: nil, lon: nil, bounds: nil, search: nil)
      @connection = Faraday.new(url: BASE_URL)
      @path = if city_name
                "/feed/#{city_name}/"
              elsif lat && lon
                "/feed/geo:#{lat};#{lon}/"
              elsif bounds
                '/map/bounds/'
              elsif search
                '/search/'
              else
                '/feed/here/'
              end
      @params = if bounds && bounds.count == 4
                  { latlng: bounds.join(',') }
                elsif search
                  { keyword: search }                  
                else
                  {}
                end
    end

    def get(params = {})
      parse(@connection.get(@path, @params.merge(params)))
    end

    private

    def parse(response)
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      raise "API Error: #{parsed_response[:message]}" if parsed_response[:status] == 'error'
      parsed_response[:data]
    end
  end
end