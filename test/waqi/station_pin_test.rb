require 'test_helper'

class StationPinTest < Minitest::Test
  def test_exists
    assert Waqi::StationPin
  end

  def test_parse
    VCR.use_cassette('map_bounds') do
      data = map_data
      assert_instance_of Array, data
      assert_equal 33, data.count
      assert_instance_of Waqi::StationPin, data.last
      assert_equal 39.982, data.last.lat
      assert_equal 116.397, data.last.lon
      assert_equal 450, data.last.uid
      assert_equal '46', data.last.aqi
    end
  end
end
