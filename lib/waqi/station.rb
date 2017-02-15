module Waqi
  class Station
    attr_reader :city, :attributions
    def self.parse(hash)
      new(city: City.parse(hash[:city]), attributions: hash[:attributions].map { |a| Attribution.parse(a) })
    end

    def initialize(city: nil, attributions: nil)
      @city = city
      @attributions = attributions
    end
  end
end
