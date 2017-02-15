$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'waqi'
require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'test/fixtures'
  c.hook_into :webmock
end

class Minitest::Test
  def client
    Waqi::Client.new(token: 'demo')
  end

  def station_data
    Waqi::StationData.new(client, city_name: 'shanghai')
  end

end
