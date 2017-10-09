require "spec_helper"

RSpec.describe DadaExpress::ParamsService do
  before do
    DadaExpress.configure do |config|
      config.app_key = '123456'
      config.app_secret = 'secret'
    end
  end

  it "return new params with key signature" do
    newParams = DadaExpress::ParamsService.process({order_id: '123456'})
    expect(newParams[:signature].length).to eq(32)
  end
end
