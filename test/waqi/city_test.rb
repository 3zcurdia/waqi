require 'test_helper'

class CityTest < Minitest::Test
  def client
    Waqi::Client.new(token: 'demo')
  end

  def subject
    Waqi::City.new(client, 'shanghai')
  end

  def test_exists
    assert Waqi::City
  end

  def test_feed_parse
    VCR.use_cassette('city_feed') do
      city = subject
      assert_equal 149, city.aqi
      assert_equal 1437, city.idx
      assert_equal 'Shanghai', city.name
      assert_equal 31.2047372, city.geo.first
      assert_equal 121.4489017, city.geo.last
      assert_equal 'http://aqicn.org/city/shanghai/', city.web_url
      assert_instance_of Array, city.attributions
      assert_equal 3, city.attributions.count
      assert_equal 'pm25', city.dominant_pollution
      assert_instance_of Waqi::WeatherCondition, city.weather_condition
      assert_instance_of DateTime, city.timestamp
      assert_equal Date.new(2017, 0o2, 15), city.timestamp.to_date
      assert_equal 13, city.timestamp.hour
      assert_equal 0, city.timestamp.minute
      assert_equal 0, city.timestamp.second
      assert_equal '+08:00', city.timestamp.zone
    end
  end

  def test_feed_parse_attributions
    VCR.use_cassette('city_feed') do
      attributions = subject.attributions
      assert_instance_of Waqi::Attribution, attributions.first
      assert_equal 'Shanghai Environment Monitoring Center(上海市环境监测中心)', attributions.first.name
      assert_equal 'http://www.semc.gov.cn/', attributions.first.url
    end
  end

  def test_feed_parse_weather_condition
    VCR.use_cassette('city_feed') do
      weather_condition = subject.weather_condition
      assert_equal 5.5, weather_condition.carbon_monoxyde
      assert_equal 2, weather_condition.dew
      assert_equal 42, weather_condition.relative_humidity
      assert_equal 16.5, weather_condition.nitrogen_dioxide
      assert_equal 64.3, weather_condition.ozone
      assert_equal 1028, weather_condition.atmospheric_pressure
      assert_equal 64, weather_condition.pm10
      assert_equal 149, weather_condition.pm25
      assert_equal 9.2, weather_condition.sulphur_dioxide
      assert_equal 15, weather_condition.temperature
      assert_equal 7.2, weather_condition.wind
    end
  end
end
