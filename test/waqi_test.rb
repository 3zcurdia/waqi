# frozen_string_literal: true

require 'test_helper'

class WaqiTest < Minitest::Test
  def test_version_number
    refute_nil ::Waqi::VERSION
  end
end
