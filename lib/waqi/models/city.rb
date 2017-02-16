module Waqi
  class City < Struct.new(:name, :geo, :url)
    def self.parse(hash)
      new(*hash.values_at(*self.members))
    end
  end
end
