# frozen_string_literal: true

module Waqi
  class City < Struct.new(:name, :geo, :url)
    def self.parse(hash)
      new(*hash.values_at(*members))
    end
  end
end
