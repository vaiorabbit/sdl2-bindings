# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL2
  extend FFI::Library
  # Define/Macro

  SDL_INIT_TIMER = 0x00000001
  SDL_INIT_AUDIO = 0x00000010
  SDL_INIT_VIDEO = 0x00000020
  SDL_INIT_JOYSTICK = 0x00000200
  SDL_INIT_HAPTIC = 0x00001000
  SDL_INIT_GAMECONTROLLER = 0x00002000
  SDL_INIT_EVENTS = 0x00004000
  SDL_INIT_SENSOR = 0x00008000
  SDL_INIT_NOPARACHUTE = 0x00100000
  SDL_INIT_EVERYTHING = ( SDL_INIT_TIMER | SDL_INIT_AUDIO | SDL_INIT_VIDEO | SDL_INIT_EVENTS | SDL_INIT_JOYSTICK | SDL_INIT_HAPTIC | SDL_INIT_GAMECONTROLLER | SDL_INIT_SENSOR )

  # Enum


  # Typedef


  # Struct


  # Function

  def self.setup_main_symbols()
    main_symbols = [
      :SDL_Init,
      :SDL_InitSubSystem,
      :SDL_QuitSubSystem,
      :SDL_WasInit,
      :SDL_Quit,
    ]
    main_args = {
      :SDL_Init => [:uint], 
      :SDL_InitSubSystem => [:uint], 
      :SDL_QuitSubSystem => [:uint], 
      :SDL_WasInit => [:uint], 
      :SDL_Quit => [], 
    }
    main_retvals = {
      :SDL_Init => :int,
      :SDL_InitSubSystem => :int,
      :SDL_QuitSubSystem => :void,
      :SDL_WasInit => :uint,
      :SDL_Quit => :void,
    }
    main_symbols.each do |sym|
      begin
        attach_function sym, main_args[sym], main_retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).")
      end
    end
  end

end

