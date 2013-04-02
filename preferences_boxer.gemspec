# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'preferences_boxer/version'

Gem::Specification.new do |spec|
  spec.name          = "preferences_boxer"
  spec.version       = PreferencesBoxer::VERSION
  spec.authors       = ["Denis Krivostchokov"]
  spec.email         = ["densomart@gmail.com"]
  spec.description   = %q{ Gem can store your settings in Yaml or AR::Store store. You can get settings with Store.name and set with Store.name= }
  spec.summary       = %q{ Store your peferences. }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
