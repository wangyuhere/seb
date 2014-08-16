# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'seb/version'

Gem::Specification.new do |spec|
  spec.name          = 'seb'
  spec.version       = Seb::VERSION
  spec.authors       = ['Yu Wang']
  spec.email         = ['wangyuhere@gmail.com']
  spec.summary       = %q{Extract data from SEB xls file and generate report}
  spec.description   = %q{It extracts data from exported xls file of SEB bank statments and generates a financial report.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split("\n")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'roo'
  spec.add_runtime_dependency 'thor'
  spec.add_runtime_dependency 'terminal-table'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'pry'
end
