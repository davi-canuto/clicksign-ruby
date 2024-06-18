$:.push File.expand_path('../lib', __FILE__)
require 'clicksign/version'

Gem::Specification.new do |spec|
  spec.name          = 'clicksign-ruby'
  spec.version       = Clicksign::VERSION
  spec.authors       = ['davi-canuto']
  spec.email         = ['davicanutogregorio@gmail.com']
  spec.description   = %q{Ruby library to interact with Clicksign}
  spec.summary       = %q{Ruby library to interact with Clicksign}
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.1.0'

  spec.add_dependency 'rest-client', '>= 1.8'

  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
end
