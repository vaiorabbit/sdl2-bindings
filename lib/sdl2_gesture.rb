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

  typedef :long_long, :SDL_GestureID

  # Struct


  # Function

  def self.setup_gesture_symbols()
      attach_function :SDL_RecordGesture, [:long_long], :int
      attach_function :SDL_SaveAllDollarTemplates, [:pointer], :int
      attach_function :SDL_SaveDollarTemplate, [:long_long, :pointer], :int
      attach_function :SDL_LoadDollarTemplates, [:long_long, :pointer], :int
  end

end

