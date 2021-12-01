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

  SDL_CONTROLLER_TYPE_UNKNOWN = 0
  SDL_CONTROLLER_TYPE_XBOX360 = 1
  SDL_CONTROLLER_TYPE_XBOXONE = 2
  SDL_CONTROLLER_TYPE_PS3 = 3
  SDL_CONTROLLER_TYPE_PS4 = 4
  SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_PRO = 5
  SDL_CONTROLLER_TYPE_VIRTUAL = 6
  SDL_CONTROLLER_TYPE_PS5 = 7
  SDL_CONTROLLER_TYPE_AMAZON_LUNA = 8
  SDL_CONTROLLER_TYPE_GOOGLE_STADIA = 9
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
  SDL_CONTROLLER_BUTTON_MISC1 = 15
  SDL_CONTROLLER_BUTTON_PADDLE1 = 16
  SDL_CONTROLLER_BUTTON_PADDLE2 = 17
  SDL_CONTROLLER_BUTTON_PADDLE3 = 18
  SDL_CONTROLLER_BUTTON_PADDLE4 = 19
  SDL_CONTROLLER_BUTTON_TOUCHPAD = 20
  SDL_CONTROLLER_BUTTON_MAX = 21

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

  typedef :int, :SDL_GameControllerType
  typedef :int, :SDL_GameControllerBindType
  typedef :int, :SDL_GameControllerAxis
  typedef :int, :SDL_GameControllerButton

  # Struct


  # Function

  def self.setup_gamecontroller_symbols()
    symbols = [
      :SDL_GameControllerAddMappingsFromRW,
      :SDL_GameControllerAddMapping,
      :SDL_GameControllerNumMappings,
      :SDL_GameControllerMappingForIndex,
      :SDL_GameControllerMappingForGUID,
      :SDL_GameControllerMapping,
      :SDL_IsGameController,
      :SDL_GameControllerNameForIndex,
      :SDL_GameControllerTypeForIndex,
      :SDL_GameControllerMappingForDeviceIndex,
      :SDL_GameControllerOpen,
      :SDL_GameControllerFromInstanceID,
      :SDL_GameControllerFromPlayerIndex,
      :SDL_GameControllerName,
      :SDL_GameControllerGetType,
      :SDL_GameControllerGetPlayerIndex,
      :SDL_GameControllerSetPlayerIndex,
      :SDL_GameControllerGetVendor,
      :SDL_GameControllerGetProduct,
      :SDL_GameControllerGetProductVersion,
      :SDL_GameControllerGetSerial,
      :SDL_GameControllerGetAttached,
      :SDL_GameControllerGetJoystick,
      :SDL_GameControllerEventState,
      :SDL_GameControllerUpdate,
      :SDL_GameControllerGetAxisFromString,
      :SDL_GameControllerGetStringForAxis,
      :SDL_GameControllerGetBindForAxis,
      :SDL_GameControllerHasAxis,
      :SDL_GameControllerGetAxis,
      :SDL_GameControllerGetButtonFromString,
      :SDL_GameControllerGetStringForButton,
      :SDL_GameControllerGetBindForButton,
      :SDL_GameControllerHasButton,
      :SDL_GameControllerGetButton,
      :SDL_GameControllerGetNumTouchpads,
      :SDL_GameControllerGetNumTouchpadFingers,
      :SDL_GameControllerGetTouchpadFinger,
      :SDL_GameControllerHasSensor,
      :SDL_GameControllerSetSensorEnabled,
      :SDL_GameControllerIsSensorEnabled,
      :SDL_GameControllerGetSensorDataRate,
      :SDL_GameControllerGetSensorData,
      :SDL_GameControllerRumble,
      :SDL_GameControllerRumbleTriggers,
      :SDL_GameControllerHasLED,
      :SDL_GameControllerHasRumble,
      :SDL_GameControllerHasRumbleTriggers,
      :SDL_GameControllerSetLED,
      :SDL_GameControllerSendEffect,
      :SDL_GameControllerClose,
      :SDL_GameControllerGetAppleSFSymbolsNameForButton,
      :SDL_GameControllerGetAppleSFSymbolsNameForAxis,
    ]
    args = {
      :SDL_GameControllerAddMappingsFromRW => [:pointer, :int],
      :SDL_GameControllerAddMapping => [:pointer],
      :SDL_GameControllerNumMappings => [],
      :SDL_GameControllerMappingForIndex => [:int],
      :SDL_GameControllerMappingForGUID => [SDL_JoystickGUID.by_value],
      :SDL_GameControllerMapping => [:pointer],
      :SDL_IsGameController => [:int],
      :SDL_GameControllerNameForIndex => [:int],
      :SDL_GameControllerTypeForIndex => [:int],
      :SDL_GameControllerMappingForDeviceIndex => [:int],
      :SDL_GameControllerOpen => [:int],
      :SDL_GameControllerFromInstanceID => [:int],
      :SDL_GameControllerFromPlayerIndex => [:int],
      :SDL_GameControllerName => [:pointer],
      :SDL_GameControllerGetType => [:pointer],
      :SDL_GameControllerGetPlayerIndex => [:pointer],
      :SDL_GameControllerSetPlayerIndex => [:pointer, :int],
      :SDL_GameControllerGetVendor => [:pointer],
      :SDL_GameControllerGetProduct => [:pointer],
      :SDL_GameControllerGetProductVersion => [:pointer],
      :SDL_GameControllerGetSerial => [:pointer],
      :SDL_GameControllerGetAttached => [:pointer],
      :SDL_GameControllerGetJoystick => [:pointer],
      :SDL_GameControllerEventState => [:int],
      :SDL_GameControllerUpdate => [],
      :SDL_GameControllerGetAxisFromString => [:pointer],
      :SDL_GameControllerGetStringForAxis => [:int],
      :SDL_GameControllerGetBindForAxis => [:pointer, :int],
      :SDL_GameControllerHasAxis => [:pointer, :int],
      :SDL_GameControllerGetAxis => [:pointer, :int],
      :SDL_GameControllerGetButtonFromString => [:pointer],
      :SDL_GameControllerGetStringForButton => [:int],
      :SDL_GameControllerGetBindForButton => [:pointer, :int],
      :SDL_GameControllerHasButton => [:pointer, :int],
      :SDL_GameControllerGetButton => [:pointer, :int],
      :SDL_GameControllerGetNumTouchpads => [:pointer],
      :SDL_GameControllerGetNumTouchpadFingers => [:pointer, :int],
      :SDL_GameControllerGetTouchpadFinger => [:pointer, :int, :int, :pointer, :pointer, :pointer, :pointer],
      :SDL_GameControllerHasSensor => [:pointer, :int],
      :SDL_GameControllerSetSensorEnabled => [:pointer, :int, :int],
      :SDL_GameControllerIsSensorEnabled => [:pointer, :int],
      :SDL_GameControllerGetSensorDataRate => [:pointer, :int],
      :SDL_GameControllerGetSensorData => [:pointer, :int, :pointer, :int],
      :SDL_GameControllerRumble => [:pointer, :ushort, :ushort, :uint],
      :SDL_GameControllerRumbleTriggers => [:pointer, :ushort, :ushort, :uint],
      :SDL_GameControllerHasLED => [:pointer],
      :SDL_GameControllerHasRumble => [:pointer],
      :SDL_GameControllerHasRumbleTriggers => [:pointer],
      :SDL_GameControllerSetLED => [:pointer, :uchar, :uchar, :uchar],
      :SDL_GameControllerSendEffect => [:pointer, :pointer, :int],
      :SDL_GameControllerClose => [:pointer],
      :SDL_GameControllerGetAppleSFSymbolsNameForButton => [:pointer, :int],
      :SDL_GameControllerGetAppleSFSymbolsNameForAxis => [:pointer, :int],
    }
    retvals = {
      :SDL_GameControllerAddMappingsFromRW => :int,
      :SDL_GameControllerAddMapping => :int,
      :SDL_GameControllerNumMappings => :int,
      :SDL_GameControllerMappingForIndex => :pointer,
      :SDL_GameControllerMappingForGUID => :pointer,
      :SDL_GameControllerMapping => :pointer,
      :SDL_IsGameController => :int,
      :SDL_GameControllerNameForIndex => :pointer,
      :SDL_GameControllerTypeForIndex => :int,
      :SDL_GameControllerMappingForDeviceIndex => :pointer,
      :SDL_GameControllerOpen => :pointer,
      :SDL_GameControllerFromInstanceID => :pointer,
      :SDL_GameControllerFromPlayerIndex => :pointer,
      :SDL_GameControllerName => :pointer,
      :SDL_GameControllerGetType => :int,
      :SDL_GameControllerGetPlayerIndex => :int,
      :SDL_GameControllerSetPlayerIndex => :void,
      :SDL_GameControllerGetVendor => :ushort,
      :SDL_GameControllerGetProduct => :ushort,
      :SDL_GameControllerGetProductVersion => :ushort,
      :SDL_GameControllerGetSerial => :pointer,
      :SDL_GameControllerGetAttached => :int,
      :SDL_GameControllerGetJoystick => :pointer,
      :SDL_GameControllerEventState => :int,
      :SDL_GameControllerUpdate => :void,
      :SDL_GameControllerGetAxisFromString => :int,
      :SDL_GameControllerGetStringForAxis => :pointer,
      :SDL_GameControllerGetBindForAxis => SDL_GameControllerButtonBind,
      :SDL_GameControllerHasAxis => :int,
      :SDL_GameControllerGetAxis => :short,
      :SDL_GameControllerGetButtonFromString => :int,
      :SDL_GameControllerGetStringForButton => :pointer,
      :SDL_GameControllerGetBindForButton => SDL_GameControllerButtonBind,
      :SDL_GameControllerHasButton => :int,
      :SDL_GameControllerGetButton => :uchar,
      :SDL_GameControllerGetNumTouchpads => :int,
      :SDL_GameControllerGetNumTouchpadFingers => :int,
      :SDL_GameControllerGetTouchpadFinger => :int,
      :SDL_GameControllerHasSensor => :int,
      :SDL_GameControllerSetSensorEnabled => :int,
      :SDL_GameControllerIsSensorEnabled => :int,
      :SDL_GameControllerGetSensorDataRate => :float,
      :SDL_GameControllerGetSensorData => :int,
      :SDL_GameControllerRumble => :int,
      :SDL_GameControllerRumbleTriggers => :int,
      :SDL_GameControllerHasLED => :int,
      :SDL_GameControllerHasRumble => :int,
      :SDL_GameControllerHasRumbleTriggers => :int,
      :SDL_GameControllerSetLED => :int,
      :SDL_GameControllerSendEffect => :int,
      :SDL_GameControllerClose => :void,
      :SDL_GameControllerGetAppleSFSymbolsNameForButton => :pointer,
      :SDL_GameControllerGetAppleSFSymbolsNameForAxis => :pointer,
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

