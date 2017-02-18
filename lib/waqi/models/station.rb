module Waqi
  class Station
    attr_reader :city, :attributions
    def self.parse(hash)
      city = hash[:city] ? City.parse(hash[:city]) : (hash[:name] ? City.parse(hash) : nil)
      attributions = hash[:attributions] ? hash[:attributions] : []
      new(city: city, attributions: attributions.map { |a| Attribution.parse(a) })
    end

    def initialize(city: nil, attributions: nil)
      @city = city
      @attributions = attributions
    end
  end
end
