module Waqi
  module Service
    class Station < City
      def initialize(uid)
        super("@#{uid}")
      end
    end
  end
end
