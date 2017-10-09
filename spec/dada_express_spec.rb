require "spec_helper"

RSpec.describe DadaExpress do
  it "has a version number" do
    expect(DadaExpress::VERSION).not_to be nil
  end

  it "has configuration for app_key and app_secret" do
    DadaExpress.configure do |config|
      config.app_key = '123456'
      config.app_secret = 'secret'
    end
    expect(DadaExpress.configuration.app_key).to eq('123456')
    expect(DadaExpress.configuration.app_secret).to eq('secret')
  end

  it "has default base url configuration" do
    expect(DadaExpress.configuration.base_url).to eq('http://newopen.imdada.cn')
  end
end
