# 负载均衡模块
module EnquiryConsul::Balancer
  module_function

  def pick_service(service_name, services)
    pre_index = Rails.cache.read(service_name)
    next_index = pre_index && pre_index + 1 || 0
    next_index = 0 if next_index >= services.size
    Rails.cache.write(service_name, next_index)
    services[next_index]
  end
end
