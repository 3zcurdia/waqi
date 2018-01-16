# frozen_string_literal: true

require 'test_helper'

class StationTest < Minitest::Test
  def test_exists
    assert Waqi::Station
  end

  def test_parse
    VCR.use_cassette('city_feed') do
      station = station_data.station
      assert_instance_of Waqi::Station, station
      assert_instance_of Waqi::City, station.city
      assert_instance_of Array, station.attributions
      assert_instance_of Waqi::Attribution, station.attributions.last
    end
  end
end
