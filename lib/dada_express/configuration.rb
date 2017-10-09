module DadaExpress
  class Configuration
    attr_accessor :app_key, :base_url, :app_secret

    def initialize
      @base_url = 'http://newopen.imdada.cn'
    end
  end
end
