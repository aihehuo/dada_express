module DadaExpress
  class ParamsService
    class << self
      def process(params = '')
        Sign.encode(base_params(params))
      end

      private

      def base_params(params)
        {
          app_key: DadaExpress.configuration.app_key,
          timestamp: Time.now.to_i.to_s,
          format: 'json',
          v: '1.0',
          source_id: DadaExpress.configuration.source_id,
          body: params == '' ? params : params.to_json
        }
      end
    end
  end
end
