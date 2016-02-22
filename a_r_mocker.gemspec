# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'a_r_mocker/version'

Gem::Specification.new do |spec|
  spec.name          = 'a_r_mocker'
  spec.version       = ARMocker::VERSION
  spec.authors       = ['Steven Spiel']
  spec.email         = ['stevenspiel@gmail.com']

  spec.summary       = 'Mocks ActiveRecord models and relationships for form objects.'
  spec.description   = "Create relationships and models that work with form objects and don't dependant on a database schema."
  spec.homepage      = ''

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
