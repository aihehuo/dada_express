module DadaExpress
  ORDER_DETAIL_PATHNAME = '/api/order/status/query'
  NEW_ORDER_PATHNAME = '/api/order/addOrder'
  CITY_CODES_PATHNAME = '/api/cityCode/list'

  class Request
    def initialize(params = '')
      @params = params
    end

    def excute(url)
      @response ||= RestClient.post url, ParamsService.process(@params).to_json, {content_type: :json, accept: :json}
      JSON.parse(@response.body)
    end

    def order_detail
      excute(DadaExpress.configuration.base_url + ORDER_DETAIL_PATHNAME)
    end

    def city_codes
      excute(DadaExpress.configuration.base_url + CITY_CODES_PATHNAME)
    end

    def new_order
      excute(DadaExpress.configuration.base_url + NEW_ORDER_PATHNAME)
    end
  end
end
