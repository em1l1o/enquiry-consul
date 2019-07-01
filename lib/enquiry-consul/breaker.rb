# 熔断器，主导熔断机制
module Enquiry::Breaker
  module_function

  def run(request, services, reconnect: 3)
    # 发送请求
    response = Net::HTTP.start(request.uri.host, request.uri.port, read_timeout: 10) { |http| http.request request }
    # TODO: (zhangjiayuan) 目前为通用判断，今后为不同情况增加不同熔断机制
    raise if response.code != '200'
    response
  rescue
    reconnect -= 1
    raise "请求服务失败" if reconnect <= 0
    # 重新组装请求
    request = reassemble_request(request, services)
    sleep(1)
    retry
  end

  def reassemble_request(request, services)
    service_name = services.first.ServiceName
    service = Enquiry::Balancer.pick_service(service_name, services)
    uri = URI("http://#{service.ServiceAddress}:#{service.ServicePort}#{request.uri.path}")
    request.instance_variable_set(:@uri, uri)
    request['host'] = uri.host
    request
  end
end
