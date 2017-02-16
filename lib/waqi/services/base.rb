require 'faraday'
require 'json'
module Waqi
  module Service
    class Base
      BASE_URL = 'https://api.waqi.info'.freeze

      def initialize(params = {})
        @connection = Faraday.new(url: BASE_URL)
        @params = params
      end

      def get(options = {})
        parse(@connection.get(self.path, @params.merge(options)))
      end

      def path
        raise "path has not beed defined"
      end

      private

      def parse(response)
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        raise "API Error: #{parsed_response[:data]}" if parsed_response[:status] == 'error'
        parsed_response[:data]
      end
    end
  end
end
