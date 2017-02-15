require 'test_helper'

class ClientTest < Minitest::Test
  def subject
    Waqi::Client.new(token: 'demo')
  end

  def test_exists
    assert Waqi::Client
  end

  def test_city_feed
    VCR.use_cassette('city_feed') do
      assert_instance_of Waqi::StationData, subject.city_feed('shanghai')
    end
  end

  def test_geo_feed
    VCR.use_cassette('geo_feed') do
      station_data = subject.geo_feed(37.774929, -122.419416)
      assert_instance_of Waqi::StationData, station_data
      assert_equal 'San Francisco-Arkansas Street, San Francisco, California', station_data.station.city.name
    end
  end

  def test_local_feed
    VCR.use_cassette('local_feed') do
      station_data = subject.local_feed
      assert_instance_of Waqi::StationData, station_data
      assert_equal 'Merced, México', station_data.station.city.name
    end
  end
end
