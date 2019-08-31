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
    symbols = [
      :SDL_GetTicks,
      :SDL_GetPerformanceCounter,
      :SDL_GetPerformanceFrequency,
      :SDL_Delay,
      :SDL_AddTimer,
      :SDL_RemoveTimer,
    ]
    args = {
      :SDL_GetTicks => [],
      :SDL_GetPerformanceCounter => [],
      :SDL_GetPerformanceFrequency => [],
      :SDL_Delay => [:uint],
      :SDL_AddTimer => [:uint, :pointer, :pointer],
      :SDL_RemoveTimer => [:int],
    }
    retvals = {
      :SDL_GetTicks => :uint,
      :SDL_GetPerformanceCounter => :ulong_long,
      :SDL_GetPerformanceFrequency => :ulong_long,
      :SDL_Delay => :void,
      :SDL_AddTimer => :int,
      :SDL_RemoveTimer => :int,
    }
    symbols.each do |sym|
      begin
        attach_function sym, args[sym], retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).")
      end
    end
  end

end

