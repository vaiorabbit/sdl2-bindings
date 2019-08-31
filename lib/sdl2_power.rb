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

  SDL_POWERSTATE_UNKNOWN = 0
  SDL_POWERSTATE_ON_BATTERY = 1
  SDL_POWERSTATE_NO_BATTERY = 2
  SDL_POWERSTATE_CHARGING = 3
  SDL_POWERSTATE_CHARGED = 4

  # Typedef

  typedef :int, :SDL_PowerState

  # Struct


  # Function

  def self.setup_power_symbols()
    symbols = [
      :SDL_GetPowerInfo,
    ]
    args = {
      :SDL_GetPowerInfo => [:pointer, :pointer],
    }
    retvals = {
      :SDL_GetPowerInfo => :int,
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

