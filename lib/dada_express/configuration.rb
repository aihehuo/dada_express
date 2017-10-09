module DadaExpress
  class Configuration
    attr_accessor :app_key, :base_url, :app_secret, :source_id

    def initialize
      @base_url = 'http://newopen.imdada.cn'
      @source_id = '73753'
    end
  end
end
