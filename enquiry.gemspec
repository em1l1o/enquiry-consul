Gem::Specification.new do |s|
  s.name = 'enquiry'.freeze
  s.version = '0.1.0'.freeze
  s.date = '2019-06-29'.freeze
  s.summary = "Early access edition".freeze
  s.description = 'simple discovery service with consul'.freeze
  s.authors = ["Emilio Chang".freeze]
  s.email = 'zhangjiayuan93@hotmail.com'.freeze
  s.files = ['lib/enquiry.rb'.freeze, 'lib/enquiry/balancer.rb'.freeze, 'lib/enquiry/breaker.rb'.freeze]
  s.license = 'MIT'.freeze
  s.homepage = 'https://github.com/em1l1o/Enquiry'.freeze

  s.add_dependency(%q<diplomat>, [">= 0"])
end
