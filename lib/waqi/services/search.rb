module Waqi
  module Service
    class Search < Base
      def initialize(keyword)
        super(keyword: keyword)
      end

      def path
        '/search/'
      end
    end
  end
end
