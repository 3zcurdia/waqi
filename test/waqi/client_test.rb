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
      assert_instance_of Waqi::City, subject.city_feed('shanghai')
    end
  end
end
