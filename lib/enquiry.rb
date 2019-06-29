# 客户端部分，对外暴露接口，功能目前为发送基本请求
# 目前封装的方法有 get post put
# @param service_name [String]
# @param api [String]
# @param data [Hash]
# @param reconnect [Integer]
# @return [Hash]
# 用例 ServiceDiscovery.post('javaPay', 'checkPayment', data: payment_params, reconnect: 5)
# TODO: (zhangjiayuan) 目前是 demo，之后会增加更多功能

module Enquiry
  require 'enquiry/balancer'
  require 'enquiry/breaker'

  %w[get post put].each do |method|
    define_singleton_method method do |service_name, api, data: {}, reconnect: 3|
      # 从 consul 获取服务
      services = Diplomat::Service.get(service_name, :all)
      raise "获取服务失败" if services.blank?
      # 进行负载均衡
      service = Balancer.pick_service(service_name, services)
      # 组装地址
      uri = URI("http://#{service.ServiceAddress}:#{service.ServicePort}/#{api}")
      # 生成请求
      request = eval("Net::HTTP::#{method.capitalize}").new(uri)
      request.set_form_data(data)
      # 熔断器发送请求
      response = Breaker.run(request, services, reconnect: reconnect)
      # 解析响应
      JSON.parse response.body
    end
  end
end
