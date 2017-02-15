require 'test_helper'

class WeatherConditionTest < Minitest::Test
  def test_exists
    assert Waqi::WeatherCondition
  end

  def test_parse
    VCR.use_cassette('city_feed') do
      weather_condition = station_data.weather_condition
      assert_instance_of Waqi::WeatherCondition, weather_condition
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
