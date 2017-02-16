require 'test_helper'

class StationDataTest < Minitest::Test
  def test_exists
    assert Waqi::StationData
  end

  def test_parse
    VCR.use_cassette('city_feed') do
      data = station_data
      assert_equal 149, data.aqi
      assert_equal 1437, data.idx
      assert_equal 'pm25', data.dominant_pollution
      assert_instance_of Waqi::Station, data.station
      assert_instance_of Waqi::WeatherCondition, data.weather_condition

      assert_instance_of DateTime, data.timestamp
      assert_equal Date.new(2017, 0o2, 15), data.timestamp.to_date
      assert_equal 13, data.timestamp.hour
      assert_equal 0, data.timestamp.minute
      assert_equal 0, data.timestamp.second
      assert_equal '+08:00', data.timestamp.zone
    end
  end

  def test_parse_search
    VCR.use_cassette('search') do
      data = search_data
      assert_instance_of Array, data
      assert_equal '-', data.last.aqi
      assert_equal 8686, data.last.uid
      refute data.last.idx
      refute data.last.dominant_pollution
      assert_equal 'City Railway Station, Bangalore, India', data.last.station.city.name
      assert data.last.station.attributions.empty?
      assert data.last.weather_condition.empty?
    end
  end
end
