# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-miil/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-miil"
  spec.version       = Omniauth::Miil::VERSION
  spec.authors       = ["xendoc"]
  spec.email         = ["xendoc@users.noreply.github.com"]

  spec.summary       = %q{OmniAuth strategy for miil}
  spec.description   = %q{OmniAuth strategy for miil}
  spec.homepage      = "https://github.com/xendoc/omniauth-miil"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.test_files    = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "omniauth", "~> 1.0"
  spec.add_dependency "omniauth-oauth2", "~> 1.1"

  spec.add_development_dependency 'rspec', '~> 2.7'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'webmock'
end
