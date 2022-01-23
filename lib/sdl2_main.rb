# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro

  INIT_TIMER = 0x00000001
  INIT_AUDIO = 0x00000010
  INIT_VIDEO = 0x00000020
  INIT_JOYSTICK = 0x00000200
  INIT_HAPTIC = 0x00001000
  INIT_GAMECONTROLLER = 0x00002000
  INIT_EVENTS = 0x00004000
  INIT_SENSOR = 0x00008000
  INIT_NOPARACHUTE = 0x00100000
  INIT_EVERYTHING = ( INIT_TIMER | INIT_AUDIO | INIT_VIDEO | INIT_EVENTS | INIT_JOYSTICK | INIT_HAPTIC | INIT_GAMECONTROLLER | INIT_SENSOR )

  # Enum


  # Typedef


  # Struct


  # Function

  def self.setup_main_symbols()
    symbols = [
      :SDL_Init,
      :SDL_InitSubSystem,
      :SDL_QuitSubSystem,
      :SDL_WasInit,
      :SDL_Quit,
    ]
    apis = {
      :SDL_Init => :Init,
      :SDL_InitSubSystem => :InitSubSystem,
      :SDL_QuitSubSystem => :QuitSubSystem,
      :SDL_WasInit => :WasInit,
      :SDL_Quit => :Quit,
    }
    args = {
      :SDL_Init => [:uint],
      :SDL_InitSubSystem => [:uint],
      :SDL_QuitSubSystem => [:uint],
      :SDL_WasInit => [:uint],
      :SDL_Quit => [],
    }
    retvals = {
      :SDL_Init => :int,
      :SDL_InitSubSystem => :int,
      :SDL_QuitSubSystem => :void,
      :SDL_WasInit => :uint,
      :SDL_Quit => :void,
    }
    symbols.each do |sym|
      begin
        attach_function apis[sym], sym, args[sym], retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).")
      end
    end
  end

end

