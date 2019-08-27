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

  SDL_TOUCH_DEVICE_INVALID = -1
  SDL_TOUCH_DEVICE_DIRECT = 0
  SDL_TOUCH_DEVICE_INDIRECT_ABSOLUTE = 1
  SDL_TOUCH_DEVICE_INDIRECT_RELATIVE = 2

  # Typedef

  typedef :long_long, :SDL_TouchID
  typedef :long_long, :SDL_FingerID
  typedef :int, :SDL_TouchDeviceType

  # Struct

  class SDL_Finger < FFI::Struct
    layout(
      :id, :long_long,
      :x, :float,
      :y, :float,
      :pressure, :float,
    )
  end


  # Function

  def self.setup_touch_symbols()
    touch_symbols = [
      :SDL_GetNumTouchDevices,
      :SDL_GetTouchDevice,
      :SDL_GetTouchDeviceType,
      :SDL_GetNumTouchFingers,
      :SDL_GetTouchFinger,
    ]
    touch_args = {
      :SDL_GetNumTouchDevices => [], 
      :SDL_GetTouchDevice => [:int], 
      :SDL_GetTouchDeviceType => [:long_long], 
      :SDL_GetNumTouchFingers => [:long_long], 
      :SDL_GetTouchFinger => [:long_long, :int], 
    }
    touch_retvals = {
      :SDL_GetNumTouchDevices => :int,
      :SDL_GetTouchDevice => :long_long,
      :SDL_GetTouchDeviceType => :int,
      :SDL_GetNumTouchFingers => :int,
      :SDL_GetTouchFinger => :pointer,
    }
    touch_symbols.each do |sym|
      begin
        attach_function sym, touch_args[sym], touch_retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).")
      end
    end
  end

end

