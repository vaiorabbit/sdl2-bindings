# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro

  TOUCH_MOUSEID = -1
  MOUSE_TOUCHID = -1

  # Enum

  TOUCH_DEVICE_INVALID = -1
  TOUCH_DEVICE_DIRECT = 0
  TOUCH_DEVICE_INDIRECT_ABSOLUTE = 1
  TOUCH_DEVICE_INDIRECT_RELATIVE = 2

  # Typedef

  typedef :long_long, :SDL_TouchID
  typedef :long_long, :SDL_FingerID
  typedef :int, :SDL_TouchDeviceType

  # Struct

  class Finger < FFI::Struct
    layout(
      :id, :long_long,
      :x, :float,
      :y, :float,
      :pressure, :float,
    )
  end


  # Function

  def self.setup_touch_symbols()
    symbols = [
      :SDL_GetNumTouchDevices,
      :SDL_GetTouchDevice,
      :SDL_GetTouchDeviceType,
      :SDL_GetNumTouchFingers,
      :SDL_GetTouchFinger,
    ]
    apis = {
      :SDL_GetNumTouchDevices => :GetNumTouchDevices,
      :SDL_GetTouchDevice => :GetTouchDevice,
      :SDL_GetTouchDeviceType => :GetTouchDeviceType,
      :SDL_GetNumTouchFingers => :GetNumTouchFingers,
      :SDL_GetTouchFinger => :GetTouchFinger,
    }
    args = {
      :SDL_GetNumTouchDevices => [],
      :SDL_GetTouchDevice => [:int],
      :SDL_GetTouchDeviceType => [:long_long],
      :SDL_GetNumTouchFingers => [:long_long],
      :SDL_GetTouchFinger => [:long_long, :int],
    }
    retvals = {
      :SDL_GetNumTouchDevices => :int,
      :SDL_GetTouchDevice => :long_long,
      :SDL_GetTouchDeviceType => :int,
      :SDL_GetNumTouchFingers => :int,
      :SDL_GetTouchFinger => :pointer,
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

