module DadaExpress
  ORDER_DETAIL_PATHNAME = '/api/order/status/query'

  class Request
    def initialize(params)
      @params = params
    end

    def excute(url)
      @response ||= RestClient.post url, ParamsService.process(@params), { 'Content-Type': 'application/json', 'charset': 'utf-8' }
    end

    def get_order_detail
      excute(DadaExpress.configuration.base_url + ORDER_DETAIL_PATHNAME)
    end
  end
end
