Gem::Specification.new do |s|
  s.name = 'enquiry-consul'.freeze
  s.version = '0.1.7'.freeze
  s.date = '2019-06-29'.freeze
  s.summary = "Early access edition".freeze
  s.description = 'simple discovery service with consul'.freeze
  s.authors = ["Emilio Chang".freeze]
  s.email = 'zhangjiayuan93@hotmail.com'.freeze
  s.files = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
  s.license = 'MIT'.freeze
  s.homepage = 'https://github.com/em1l1o/enquiry-consul'.freeze

  s.add_dependency(%q<diplomat>, [">= 0"])
end
