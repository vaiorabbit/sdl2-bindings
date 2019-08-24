# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'
require_relative 'sdl2_joystick'

module SDL2
  extend FFI::Library
  # Define/Macro


  # Enum

  SDL_CONTROLLER_BINDTYPE_NONE = 0
  SDL_CONTROLLER_BINDTYPE_BUTTON = 1
  SDL_CONTROLLER_BINDTYPE_AXIS = 2
  SDL_CONTROLLER_BINDTYPE_HAT = 3
  SDL_CONTROLLER_AXIS_INVALID = -1
  SDL_CONTROLLER_AXIS_LEFTX = 0
  SDL_CONTROLLER_AXIS_LEFTY = 1
  SDL_CONTROLLER_AXIS_RIGHTX = 2
  SDL_CONTROLLER_AXIS_RIGHTY = 3
  SDL_CONTROLLER_AXIS_TRIGGERLEFT = 4
  SDL_CONTROLLER_AXIS_TRIGGERRIGHT = 5
  SDL_CONTROLLER_AXIS_MAX = 6
  SDL_CONTROLLER_BUTTON_INVALID = -1
  SDL_CONTROLLER_BUTTON_A = 0
  SDL_CONTROLLER_BUTTON_B = 1
  SDL_CONTROLLER_BUTTON_X = 2
  SDL_CONTROLLER_BUTTON_Y = 3
  SDL_CONTROLLER_BUTTON_BACK = 4
  SDL_CONTROLLER_BUTTON_GUIDE = 5
  SDL_CONTROLLER_BUTTON_START = 6
  SDL_CONTROLLER_BUTTON_LEFTSTICK = 7
  SDL_CONTROLLER_BUTTON_RIGHTSTICK = 8
  SDL_CONTROLLER_BUTTON_LEFTSHOULDER = 9
  SDL_CONTROLLER_BUTTON_RIGHTSHOULDER = 10
  SDL_CONTROLLER_BUTTON_DPAD_UP = 11
  SDL_CONTROLLER_BUTTON_DPAD_DOWN = 12
  SDL_CONTROLLER_BUTTON_DPAD_LEFT = 13
  SDL_CONTROLLER_BUTTON_DPAD_RIGHT = 14
  SDL_CONTROLLER_BUTTON_MAX = 15

  # Typedef


  class SDL_GameControllerButtonBind_value_hat < FFI::Struct
    layout(
        :hat, :int,
        :hat_mask, :int,
    )
  end

  class SDL_GameControllerButtonBind_value < FFI::Struct
    layout(
        :button, :int,
        :axis, :int,
        :hat, SDL_GameControllerButtonBind_value_hat.by_value,
    )
  end

  class SDL_GameControllerButtonBind < FFI::Struct
    layout(
        :bindType, :int,
        :value, SDL_GameControllerButtonBind_value.by_value,
    )
  end

  typedef :int, :SDL_GameControllerBindType
  typedef :int, :SDL_GameControllerAxis
  typedef :int, :SDL_GameControllerButton

  # Struct


  # Function

  def self.setup_gamecontroller_symbols()
      attach_function :SDL_GameControllerAddMappingsFromRW, [:pointer, :int], :int
      attach_function :SDL_GameControllerAddMapping, [:pointer], :int
      attach_function :SDL_GameControllerNumMappings, [], :int
      attach_function :SDL_GameControllerMappingForIndex, [:int], :pointer
      attach_function :SDL_GameControllerMappingForGUID, [SDL_JoystickGUID], :pointer
      attach_function :SDL_GameControllerMapping, [:pointer], :pointer
      attach_function :SDL_IsGameController, [:int], :int
      attach_function :SDL_GameControllerNameForIndex, [:int], :pointer
      attach_function :SDL_GameControllerMappingForDeviceIndex, [:int], :pointer
      attach_function :SDL_GameControllerOpen, [:int], :pointer
      attach_function :SDL_GameControllerFromInstanceID, [:int], :pointer
      attach_function :SDL_GameControllerName, [:pointer], :pointer
      attach_function :SDL_GameControllerGetPlayerIndex, [:pointer], :int
      attach_function :SDL_GameControllerGetVendor, [:pointer], :ushort
      attach_function :SDL_GameControllerGetProduct, [:pointer], :ushort
      attach_function :SDL_GameControllerGetProductVersion, [:pointer], :ushort
      attach_function :SDL_GameControllerGetAttached, [:pointer], :int
      attach_function :SDL_GameControllerGetJoystick, [:pointer], :pointer
      attach_function :SDL_GameControllerEventState, [:int], :int
      attach_function :SDL_GameControllerUpdate, [], :void
      attach_function :SDL_GameControllerGetAxisFromString, [:pointer], :int
      attach_function :SDL_GameControllerGetStringForAxis, [:int], :pointer
      attach_function :SDL_GameControllerGetBindForAxis, [:pointer, :int], SDL_GameControllerButtonBind
      attach_function :SDL_GameControllerGetAxis, [:pointer, :int], :short
      attach_function :SDL_GameControllerGetButtonFromString, [:pointer], :int
      attach_function :SDL_GameControllerGetStringForButton, [:int], :pointer
      attach_function :SDL_GameControllerGetBindForButton, [:pointer, :int], SDL_GameControllerButtonBind
      attach_function :SDL_GameControllerGetButton, [:pointer, :int], :uchar
      attach_function :SDL_GameControllerRumble, [:pointer, :ushort, :ushort, :uint], :int
      attach_function :SDL_GameControllerClose, [:pointer], :void
  end

end

