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


  # Typedef


  # Struct

  class FPSmanager < FFI::Struct
    layout(
      :framecount, :uint,
      :rateticks, :float,
      :baseticks, :uint,
      :lastticks, :uint,
      :rate, :uint,
    )
  end


  # Function

  def self.setup_gfx_framerate_symbols(output_error = false)
    symbols = [
      :SDL_initFramerate,
      :SDL_setFramerate,
      :SDL_getFramerate,
      :SDL_getFramecount,
      :SDL_framerateDelay,
    ]
    apis = {
      :SDL_initFramerate => :initFramerate,
      :SDL_setFramerate => :setFramerate,
      :SDL_getFramerate => :getFramerate,
      :SDL_getFramecount => :getFramecount,
      :SDL_framerateDelay => :framerateDelay,
    }
    args = {
      :SDL_initFramerate => [:pointer],
      :SDL_setFramerate => [:pointer, :uint],
      :SDL_getFramerate => [:pointer],
      :SDL_getFramecount => [:pointer],
      :SDL_framerateDelay => [:pointer],
    }
    retvals = {
      :SDL_initFramerate => :void,
      :SDL_setFramerate => :int,
      :SDL_getFramerate => :int,
      :SDL_getFramecount => :int,
      :SDL_framerateDelay => :uint,
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

