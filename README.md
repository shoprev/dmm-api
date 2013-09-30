# Dmm::Api

Ruby DMM Web Service API ver 2.0

## Installation

Add this line to your application's Gemfile:

    gem 'dmm-api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dmm-api

## Usage

```ruby
require 'dmm/api'

# configure
Dmm::Api.configure do |options|
  options[:api_id] = "your api id"
  options[:affiliate_id] = "your affiliate id"
  options[:site] = "DMM.com or DMM.co.jp"
  ...
end

# dmm web service api 2.0
res = Dmm::Api.get({:service => 'lod',:floor => 'nmb48',:keyword => "山本彩"})
res.code # 200
res.message # "OK"
res["result"]["items"]["item"].each do |v|
  title = v["title"]
  ...
end
```

See the [examples directory](https://github.com/shoprev/dmm-api/tree/master/example) for more usage.

Refer to [DMM Web API documentation](https://affiliate.dmm.com/api/guide/) for more infomation.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
