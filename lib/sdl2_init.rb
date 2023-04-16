# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro


  # Enum

  INIT_TIMER = 1
  INIT_AUDIO = 16
  INIT_VIDEO = 32
  INIT_JOYSTICK = 512
  INIT_HAPTIC = 4096
  INIT_GAMEPAD = 8192
  INIT_EVENTS = 16384
  INIT_SENSOR = 32768

  INIT_EVERYTHING = INIT_TIMER | INIT_AUDIO | INIT_VIDEO | INIT_EVENTS | INIT_JOYSTICK | INIT_HAPTIC | INIT_GAMEPAD | INIT_SENSOR


  # Typedef

  typedef :int, :SDL_InitFlags

  # Struct


  # Function

  def self.setup_init_symbols(output_error = false)
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
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).") if output_error
      end
    end
  end

end

