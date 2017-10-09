require 'digest'

module DadaExpress
  class Sign
    class << self
      def encode(params)
        # 第一步：将参与签名的参数按照键值(key)进行字典排序
        step1 = params.sort.to_h
        # 第二步：将排序过后的参数，进行key和value字符串拼接
        step2 = step1.inject('') {|c, (k, v)| c + k.to_s + v.to_s }
        # 第三步：将拼接后的字符串首尾加上app_secret秘钥，合成签名字符串
        step3 = DadaExpress.configuration.app_secret + step2 + DadaExpress.configuration.app_secret
        # 第四步：对签名字符串进行MD5加密，生成32位的字符串
        step4 = Digest::MD5.hexdigest step3
        # 第五步：将签名生成的32位字符串转换为大写
        step5 = step4.upcase

        params.merge({signature: step5})
      end
    end
  end
end
