# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "sdl2-bindings"
  spec.version       = "0.1.4"
  spec.authors       = ["vaiorabbit"]
  spec.email         = ["vaiorabbit@gmail.com"]
  spec.summary       = %q{Bindings for SDL2}
  spec.homepage      = "https://github.com/vaiorabbit/sdl2-bindings"
  spec.require_paths = ["lib"]
  spec.license       = "Zlib"
  spec.description   = <<-DESC
Ruby bindings for SDL2.
  DESC

  spec.required_ruby_version = '>= 2.6.0'

  spec.add_runtime_dependency 'ffi', '~> 1.15'

  spec.files = Dir.glob("lib/*.rb") +
               ["README.md", "LICENSE.txt", "ChangeLog"]
end
