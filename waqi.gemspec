# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'waqi/version'

Gem::Specification.new do |spec|
  spec.name          = 'waqi'
  spec.version       = Waqi::VERSION
  spec.authors       = ['Luis Ezcurdia']
  spec.email         = ['ing.ezcurdia@gmail.com']
  spec.license       = 'MIT'
  spec.summary       = 'World Air Quality ruby wrapper'
  spec.description   = 'Air Quality Open Data Platform ruby wrapper'
  spec.homepage      = 'https://github.com/3zcurdia/waqi'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.3'

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'pry', '~> 0.10.3'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'vcr', '~> 3.0'
  spec.add_development_dependency 'webmock', '~> 2.3'

  spec.add_dependency 'faraday', '~>  0.10'
  spec.add_dependency 'json', '~> 2.0'
end
