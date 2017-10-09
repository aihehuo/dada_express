require 'yaml'
require 'json'

if File.exist?('secret.yaml')
  secret = YAML.load_file('secret.yaml')

  RSpec.describe DadaExpress::Request do
    before do
      DadaExpress.configure do |config|
        config.app_key = secret['app_key']
        config.app_secret = secret['app_secret']
        config.base_url = 'http://newopen.qa.imdada.cn'
      end
    end

    it 'get list of city codes' do
      result = DadaExpress::Request.new().city_codes
      expect(result['status']).to eq('success')
    end

    it 'create a new order' do
      result = DadaExpress::Request.new({
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
        receiver_phone: '18251816228'
        }).new_order
      expect(result['status']).to eq('success')
    end

    it 'return order detail' do
      result = DadaExpress::Request.new({ order_id: 'AIHEHUO1234567' }).order_detail
      puts result
      expect(result['status']).to eq('success')
    end
  end
end
