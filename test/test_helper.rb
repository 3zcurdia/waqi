# frozen_string_literal: true

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
    client.city_feed('shanghai')
  end

  def map_data
    client.map_stations(39.379436, 116.091230, 40.235643, 116.784382)
  end

  def search_data
    client.search('bangalore')
  end
end
