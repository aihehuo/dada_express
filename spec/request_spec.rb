require 'yaml'
require 'json'

if File.exist?('secret.yaml')
  secret = YAML.load_file('secret.yaml')

  RSpec.describe DadaExpress::Request do
    before do
      DadaExpress.configure do |config|
        config.app_key = secret['app_key']
        config.app_secret = secret['app_secret']
      end
    end

    it 'return order detail' do
      result = DadaExpress::Request.new({ order_id: '50554347608522' }).order_detail
      expect(result['status']).to eq('success')
    end
  end
end
