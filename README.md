# DadaExpress

达达物流平台简单ruby SDK封装。

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dada_express'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dada_express

## Usage

```ruby
# Configuration
DadaExpress.configure do |config|
  config.app_key = '123456' # 必须
  config.app_secret = 'secret' # 必须
  config.base_url = 'http://newopen.imdada.cn' # 默认为production地址，可以改为测试地址
  config.source_id = '33333' # 默认为测试账号'73753'
end

# Request
# 获取订单详情
DadaExpress::Request.new({ order_id: 'YOUR ORDER ID' }).order_detail
# 获取城市列表
DadaExpress::Request.new().city_codes
# 新增订单
DadaExpress::Request.new({
  shop_no: '11047059',
  origin_id: 'AIHEHUO' + Time.now.to_i.to_s,
  city_code: '021', # 上海
  cargo_price: 100,
  is_prepay: 0,
  expected_fetch_time: 1507533817,
  receiver_name: '测试人员',
  receiver_address: '测试地址',
  receiver_lat: 31.2304,
  receiver_lng: 121.4737,
  callback: 'http://www.aihehuo.com',
  receiver_phone: '1825181XXXX'
  }).new_order
```
更多信息请参考 [官方文档](http://newopen.imdada.cn/#/development/file/index?_k=5trp03)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
