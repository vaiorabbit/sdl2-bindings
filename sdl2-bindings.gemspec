# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "sdl2-bindings"
  gem.version       = "0.0.5"
  gem.authors       = ["vaiorabbit"]
  gem.email         = ["vaiorabbit@gmail.com"]
  gem.summary       = %q{Bindings for SDL2}
  gem.homepage      = "https://github.com/vaiorabbit/sdl2-bindings"
  gem.require_paths = ["lib"]
  gem.license       = "Zlib"
  gem.description   = <<-DESC
Ruby bindings for SDL2.
  DESC

  gem.required_ruby_version = '>= 2.6.0'

  gem.files = Dir.glob("lib/*.rb") +
              ["README.md", "LICENSE.txt", "ChangeLog"]
end
