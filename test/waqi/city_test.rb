# frozen_string_literal: true

require 'test_helper'

class CityTest < Minitest::Test
  def subject
    Waqi::StationData.new(client, city_name: 'shanghai')
  end

  def test_exists
    assert Waqi::City
  end

  def test_parse
    VCR.use_cassette('city_feed') do
      city = station_data.station.city
      assert_instance_of Waqi::City, city
      assert_equal 'Shanghai', city.name
      assert_equal 31.2047372, city.geo.first
      assert_equal 121.4489017, city.geo.last
      assert_equal 'http://aqicn.org/city/shanghai/', city.url
    end
  end
end
