require 'test_helper'

class AttributionTest < Minitest::Test
  def test_exists
    assert Waqi::Attribution
  end

  def test_parse
    VCR.use_cassette('city_feed') do
      attributions = station_data.station.attributions
      assert_equal 3, attributions.count
      assert_instance_of Waqi::Attribution, attributions.first
      assert_equal 'Shanghai Environment Monitoring Center(上海市环境监测中心)', attributions.first.name
      assert_equal 'http://www.semc.gov.cn/', attributions.first.url
    end
  end
end
