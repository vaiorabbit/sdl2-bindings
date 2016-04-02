# -*- coding: utf-8 -*-
require 'fiddle/import'

module SDL2

  extend Fiddle::Importer

  SDL2_GFXPRIMITIVES_MAJOR = 1
  SDL2_GFXPRIMITIVES_MINOR = 0
  SDL2_GFXPRIMITIVES_MICRO = 1

  #
  # Fiddle's default 'extern' stores all methods into local variable '@func_map', that makes difficult to 'include SDL2'.
  # So I override it and replace '@func_map' into 'SDL2GFX_FUNCTIONS_MAP'.
  # Ref.: /lib/ruby/2.0.0/fiddle/import.rb
  #
  SDL2GFX_FUNCTIONS_MAP = {}
  def self.extern(signature, *opts)
    symname, ctype, argtype = parse_signature(signature, @type_alias)
    opt = parse_bind_options(opts)
    f = import_function(symname, ctype, argtype, opt[:call_type])
    name = symname.gsub(/@.+/,'')
    SDL2GFX_FUNCTIONS_MAP[name] = f
    begin
      /^(.+?):(\d+)/ =~ caller.first
      file, line = $1, $2.to_i
    rescue
      file, line = __FILE__, __LINE__+3
    end
    args_str="*args"
    module_eval(<<-EOS, file, line)
      def #{name}(*args, &block)
        SDL2GFX_FUNCTIONS_MAP['#{name}'].call(*args,&block)
      end
    EOS
    module_function(name)
    f
  end

  @@sdl2gfx_import_done = false

  # Load native library.
  def self.load_gfx_lib(libpath)
    unless @@sdl2gfx_import_done
      dlload(libpath)
      import_gfx_symbols()
    end
  end


  def self.import_gfx_symbols
    extern 'int pixelColor(SDL_Renderer*, short, short, unsigned int)'

    @@sdl2gfx_import_done = true
  end

end

=begin
sdl2-bindings : Yet another SDL2 wrapper for Ruby
Copyright (c) 2015-2016 vaiorabbit <http://twitter.com/vaiorabbit>

This software is provided 'as-is', without any express or implied
warranty. In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

    1. The origin of this software must not be misrepresented; you must not
    claim that you wrote the original software. If you use this software
    in a product, an acknowledgment in the product documentation would be
    appreciated but is not required.

    2. Altered source versions must be plainly marked as such, and must not be
    misrepresented as being the original software.

    3. This notice may not be removed or altered from any source
    distribution.
=end
