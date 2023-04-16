# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro

  MS_PER_SECOND = 1000
  US_PER_SECOND = 1000000
  NS_PER_SECOND = 1000000000
  NS_PER_MS = 1000000
  NS_PER_US = 1000

  # Enum


  # Typedef

  callback :SDL_TimerCallback, [:uint, :pointer], :uint
  typedef :int, :SDL_TimerID

  # Struct


  # Function

  def self.setup_timer_symbols(output_error = false)
    symbols = [
      :SDL_GetTicks,
      :SDL_GetTicksNS,
      :SDL_GetPerformanceCounter,
      :SDL_GetPerformanceFrequency,
      :SDL_Delay,
      :SDL_DelayNS,
      :SDL_AddTimer,
      :SDL_RemoveTimer,
    ]
    apis = {
      :SDL_GetTicks => :GetTicks,
      :SDL_GetTicksNS => :GetTicksNS,
      :SDL_GetPerformanceCounter => :GetPerformanceCounter,
      :SDL_GetPerformanceFrequency => :GetPerformanceFrequency,
      :SDL_Delay => :Delay,
      :SDL_DelayNS => :DelayNS,
      :SDL_AddTimer => :AddTimer,
      :SDL_RemoveTimer => :RemoveTimer,
    }
    args = {
      :SDL_GetTicks => [],
      :SDL_GetTicksNS => [],
      :SDL_GetPerformanceCounter => [],
      :SDL_GetPerformanceFrequency => [],
      :SDL_Delay => [:uint],
      :SDL_DelayNS => [:ulong_long],
      :SDL_AddTimer => [:uint, :SDL_TimerCallback, :pointer],
      :SDL_RemoveTimer => [:int],
    }
    retvals = {
      :SDL_GetTicks => :ulong_long,
      :SDL_GetTicksNS => :ulong_long,
      :SDL_GetPerformanceCounter => :ulong_long,
      :SDL_GetPerformanceFrequency => :ulong_long,
      :SDL_Delay => :void,
      :SDL_DelayNS => :void,
      :SDL_AddTimer => :int,
      :SDL_RemoveTimer => :int,
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

