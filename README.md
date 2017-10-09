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

# Query
# 现在只支持获取订单详情
DadaExpress::Request.new({ order_id: 'YOUR ORDER ID' }).get_order_detail
```
更多信息请参考 [官方文档](http://newopen.imdada.cn/#/development/file/index?_k=5trp03)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
