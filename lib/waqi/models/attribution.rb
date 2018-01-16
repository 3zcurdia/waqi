# frozen_string_literal: true

module Waqi
  class Attribution < Struct.new(:name, :url)
    def self.parse(hash)
      new(*hash.values_at(*members))
    end
  end
end
