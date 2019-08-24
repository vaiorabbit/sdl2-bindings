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
      attach_function :SDL_GetNumTouchDevices, [], :int
      attach_function :SDL_GetTouchDevice, [:int], :long_long
      attach_function :SDL_GetTouchDeviceType, [:long_long], :int
      attach_function :SDL_GetNumTouchFingers, [:long_long], :int
      attach_function :SDL_GetTouchFinger, [:long_long, :int], :pointer
  end

end

