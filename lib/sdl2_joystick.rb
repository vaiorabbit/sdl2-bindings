# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL2
  extend FFI::Library
  # Define/Macro

  SDL_JOYSTICK_AXIS_MAX = 32767
  SDL_JOYSTICK_AXIS_MIN = -32768
  SDL_HAT_CENTERED = 0x00
  SDL_HAT_UP = 0x01
  SDL_HAT_RIGHT = 0x02
  SDL_HAT_DOWN = 0x04
  SDL_HAT_LEFT = 0x08
  SDL_HAT_RIGHTUP = ( SDL_HAT_RIGHT | SDL_HAT_UP )
  SDL_HAT_RIGHTDOWN = ( SDL_HAT_RIGHT | SDL_HAT_DOWN )
  SDL_HAT_LEFTUP = ( SDL_HAT_LEFT | SDL_HAT_UP )
  SDL_HAT_LEFTDOWN = ( SDL_HAT_LEFT | SDL_HAT_DOWN )

  # Enum

  SDL_JOYSTICK_TYPE_UNKNOWN = 0
  SDL_JOYSTICK_TYPE_GAMECONTROLLER = 1
  SDL_JOYSTICK_TYPE_WHEEL = 2
  SDL_JOYSTICK_TYPE_ARCADE_STICK = 3
  SDL_JOYSTICK_TYPE_FLIGHT_STICK = 4
  SDL_JOYSTICK_TYPE_DANCE_PAD = 5
  SDL_JOYSTICK_TYPE_GUITAR = 6
  SDL_JOYSTICK_TYPE_DRUM_KIT = 7
  SDL_JOYSTICK_TYPE_ARCADE_PAD = 8
  SDL_JOYSTICK_TYPE_THROTTLE = 9
  SDL_JOYSTICK_POWER_UNKNOWN = -1
  SDL_JOYSTICK_POWER_EMPTY = 0
  SDL_JOYSTICK_POWER_LOW = 1
  SDL_JOYSTICK_POWER_MEDIUM = 2
  SDL_JOYSTICK_POWER_FULL = 3
  SDL_JOYSTICK_POWER_WIRED = 4
  SDL_JOYSTICK_POWER_MAX = 5

  # Typedef

  typedef :int, :SDL_JoystickID
  typedef :int, :SDL_JoystickType
  typedef :int, :SDL_JoystickPowerLevel

  # Struct

  class SDL_JoystickGUID < FFI::Struct
    layout(
      :data, [:uchar, 16],
    )
  end


  # Function

  def self.setup_joystick_symbols()
      attach_function :SDL_LockJoysticks, [], :void
      attach_function :SDL_UnlockJoysticks, [], :void
      attach_function :SDL_NumJoysticks, [], :int
      attach_function :SDL_JoystickNameForIndex, [:int], :pointer
      attach_function :SDL_JoystickGetDevicePlayerIndex, [:int], :int
      attach_function :SDL_JoystickGetDeviceGUID, [:int], SDL_JoystickGUID
      attach_function :SDL_JoystickGetDeviceVendor, [:int], :ushort
      attach_function :SDL_JoystickGetDeviceProduct, [:int], :ushort
      attach_function :SDL_JoystickGetDeviceProductVersion, [:int], :ushort
      attach_function :SDL_JoystickGetDeviceType, [:int], :int
      attach_function :SDL_JoystickGetDeviceInstanceID, [:int], :int
      attach_function :SDL_JoystickOpen, [:int], :pointer
      attach_function :SDL_JoystickFromInstanceID, [:int], :pointer
      attach_function :SDL_JoystickName, [:pointer], :pointer
      attach_function :SDL_JoystickGetPlayerIndex, [:pointer], :int
      attach_function :SDL_JoystickGetGUID, [:pointer], SDL_JoystickGUID
      attach_function :SDL_JoystickGetVendor, [:pointer], :ushort
      attach_function :SDL_JoystickGetProduct, [:pointer], :ushort
      attach_function :SDL_JoystickGetProductVersion, [:pointer], :ushort
      attach_function :SDL_JoystickGetType, [:pointer], :int
      attach_function :SDL_JoystickGetGUIDString, [SDL_JoystickGUID, :pointer, :int], :void
      attach_function :SDL_JoystickGetGUIDFromString, [:pointer], SDL_JoystickGUID
      attach_function :SDL_JoystickGetAttached, [:pointer], :int
      attach_function :SDL_JoystickInstanceID, [:pointer], :int
      attach_function :SDL_JoystickNumAxes, [:pointer], :int
      attach_function :SDL_JoystickNumBalls, [:pointer], :int
      attach_function :SDL_JoystickNumHats, [:pointer], :int
      attach_function :SDL_JoystickNumButtons, [:pointer], :int
      attach_function :SDL_JoystickUpdate, [], :void
      attach_function :SDL_JoystickEventState, [:int], :int
      attach_function :SDL_JoystickGetAxis, [:pointer, :int], :short
      attach_function :SDL_JoystickGetAxisInitialState, [:pointer, :int, :pointer], :int
      attach_function :SDL_JoystickGetHat, [:pointer, :int], :uchar
      attach_function :SDL_JoystickGetBall, [:pointer, :int, :pointer, :pointer], :int
      attach_function :SDL_JoystickGetButton, [:pointer, :int], :uchar
      attach_function :SDL_JoystickRumble, [:pointer, :ushort, :ushort, :uint], :int
      attach_function :SDL_JoystickClose, [:pointer], :void
      attach_function :SDL_JoystickCurrentPowerLevel, [:pointer], :int
  end

end

