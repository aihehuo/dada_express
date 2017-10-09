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

    it 'return order detail' do
      result = DadaExpress::Request.new({ order_id: '20170210011' }).order_detail
      puts result
      expect(result['status']).to eq('success')
    end
  end
end
