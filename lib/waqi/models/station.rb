# frozen_string_literal: true

module Waqi
  class Station
    attr_reader :city, :attributions
    def self.parse(hash)
      city = if hash[:city]
               City.parse(hash[:city])
             elsif hash[:name]
               City.parse(hash)
             end
      attributions = hash[:attributions] ? hash[:attributions] : []
      new(city: city, attributions: attributions.map { |a| Attribution.parse(a) })
    end

    def initialize(city: nil, attributions: nil)
      @city = city
      @attributions = attributions
    end
  end
end
