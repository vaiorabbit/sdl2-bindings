# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL2
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

  def self.setup_gfx_framerate_symbols()
      attach_function :SDL_initFramerate, [:pointer], :void
      attach_function :SDL_setFramerate, [:pointer, :uint], :int
      attach_function :SDL_getFramerate, [:pointer], :int
      attach_function :SDL_getFramecount, [:pointer], :int
      attach_function :SDL_framerateDelay, [:pointer], :uint
  end

end

