# -*- coding: utf-8 -*-
require 'fiddle/import'
require_relative 'hints'

module SDL2

  extend Fiddle::Importer

  #
  # Fiddle's default 'extern' stores all methods into local variable '@func_map', that makes difficult to 'include SDL2'.
  # So I override it and replace '@func_map' into 'SDL2_FUNCTIONS_MAP'.
  # Ref.: /lib/ruby/2.0.0/fiddle/import.rb
  #
  SDL2_FUNCTIONS_MAP = {}
  def self.extern(signature, *opts)
    symname, ctype, argtype = parse_signature(signature, @type_alias)
    opt = parse_bind_options(opts)
    f = import_function(symname, ctype, argtype, opt[:call_type])
    name = symname.gsub(/@.+/,'')
    SDL2_FUNCTIONS_MAP[name] = f
    begin
      /^(.+?):(\d+)/ =~ caller.first
      file, line = $1, $2.to_i
    rescue
      file, line = __FILE__, __LINE__+3
    end
    args_str="*args"
    module_eval(<<-EOS, file, line)
      def #{name}(*args, &block)
        SDL2_FUNCTIONS_MAP['#{name}'].call(*args,&block)
      end
    EOS
    module_function(name)
    f
  end

  @@sdl2_import_done = false

  # Load native library.
  def self.load_lib(libpath)
    dlload(libpath)
    import_symbols() unless @@sdl2_import_done
  end


  SDL_INIT_TIMER          = 0x00000001
  SDL_INIT_AUDIO          = 0x00000010
  SDL_INIT_VIDEO          = 0x00000020  # SDL_INIT_VIDEO implies SDL_INIT_EVENTS
  SDL_INIT_JOYSTICK       = 0x00000200  # SDL_INIT_JOYSTICK implies SDL_INIT_EVENTS
  SDL_INIT_HAPTIC         = 0x00001000
  SDL_INIT_GAMECONTROLLER = 0x00002000  # SDL_INIT_GAMECONTROLLER implies SDL_INIT_JOYSTICK
  SDL_INIT_EVENTS         = 0x00004000
  SDL_INIT_NOPARACHUTE    = 0x00100000  # Don't catch fatal signals
  SDL_INIT_EVERYTHING     = (SDL_INIT_TIMER | SDL_INIT_AUDIO | SDL_INIT_VIDEO | SDL_INIT_EVENTS | SDL_INIT_JOYSTICK | SDL_INIT_HAPTIC | SDL_INIT_GAMECONTROLLER)

  def self.import_symbols

    extern 'int SDL_Init(int)'
    extern 'void SDL_Quit()'

    self.import_hints_symbols

    @@sdl2_import_done = true
  end

end
