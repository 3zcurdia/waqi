# Waqi
[![Build Status](https://travis-ci.org/3zcurdia/waqi.svg?branch=master)](https://travis-ci.org/3zcurdia/waqi) [![Code Climate](https://lima.codeclimate.com/github/3zcurdia/waqi/badges/gpa.svg)](https://lima.codeclimate.com/github/3zcurdia/waqi)

[Air Quality Open Data Platform](http://aqicn.org/api/) ruby wrapper

## Installation

```ruby
gem 'waqi'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install waqi

## Usage

Initialize the client

```ruby
  require 'waqi'
  client = Waqi::Client.new(token: 'secret token')
```
City feed, it returns StationData

```ruby
  client.city_feed('shanghai')
```

Station feed, it returns StationData

```ruby
  client.station_feed(400)
```

Geolocalized feed, it returns StationData

```ruby
  client.geo_feed(37.774929, -122.419416)
```

Local feed, it returns the nearest StationData

```ruby
  client.local_feed
```

Feed map within bounds, it returns an array of  StationPin

```ruby
  client.map_stations(39.379436, 116.091230, 40.235643, 116.784382)
```

Search by keyword, it returns an array of StationData

```ruby
  client.search('bangalore')
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/3zcurdia/waqi
