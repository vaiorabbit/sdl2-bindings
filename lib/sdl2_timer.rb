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

  callback :SDL_TimerCallback, [:uint, :pointer], :uint
  typedef :int, :SDL_TimerID

  # Struct


  # Function

  def self.setup_timer_symbols()
      attach_function :SDL_GetTicks, [], :uint
      attach_function :SDL_GetPerformanceCounter, [], :ulong_long
      attach_function :SDL_GetPerformanceFrequency, [], :ulong_long
      attach_function :SDL_Delay, [:uint], :void
      attach_function :SDL_AddTimer, [:uint, :pointer, :pointer], :int
      attach_function :SDL_RemoveTimer, [:int], :int
  end

end

