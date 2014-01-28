Gem::Specification.new do |s|
  s.name          = 'gateway_signup'
  s.version       = '0.1.0'
  s.date          = '2014-01-28'
  s.summary       = "Spreedly Gateway Registration Field Lookup"
  s.description   = "Small library for reading a config and returning the fields required to register a specific gateway with Spreedly"
  s.authors       = ["Glen Holcomb"]
  s.email         = 'dev@atpay.com'
  s.files         = `git ls-files`.split($/)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.homepage      = "https://github.com/atpay/gateway_signup"
  s.executables  = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.add_runtime_dependency 'sqlite3'
end