module Waqi
  module Service
    class Search < Base
      def initialize(keyword)
        super(keyword: keyword)
      end

      def path
        '/search/'.freeze
      end
    end
  end
end
