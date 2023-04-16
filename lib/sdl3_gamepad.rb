# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'
require_relative 'sdl2_joystick'

module SDL
  extend FFI::Library
  # Define/Macro


  # Enum

  GAMEPAD_TYPE_UNKNOWN = 0
  GAMEPAD_TYPE_VIRTUAL = 1
  GAMEPAD_TYPE_XBOX360 = 2
  GAMEPAD_TYPE_XBOXONE = 3
  GAMEPAD_TYPE_PS3 = 4
  GAMEPAD_TYPE_PS4 = 5
  GAMEPAD_TYPE_PS5 = 6
  GAMEPAD_TYPE_NINTENDO_SWITCH_PRO = 7
  GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT = 8
  GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT = 9
  GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_PAIR = 10
  GAMEPAD_TYPE_AMAZON_LUNA = 11
  GAMEPAD_TYPE_GOOGLE_STADIA = 12
  GAMEPAD_TYPE_NVIDIA_SHIELD = 13
  GAMEPAD_BUTTON_INVALID = -1
  GAMEPAD_BUTTON_A = 0
  GAMEPAD_BUTTON_B = 1
  GAMEPAD_BUTTON_X = 2
  GAMEPAD_BUTTON_Y = 3
  GAMEPAD_BUTTON_BACK = 4
  GAMEPAD_BUTTON_GUIDE = 5
  GAMEPAD_BUTTON_START = 6
  GAMEPAD_BUTTON_LEFT_STICK = 7
  GAMEPAD_BUTTON_RIGHT_STICK = 8
  GAMEPAD_BUTTON_LEFT_SHOULDER = 9
  GAMEPAD_BUTTON_RIGHT_SHOULDER = 10
  GAMEPAD_BUTTON_DPAD_UP = 11
  GAMEPAD_BUTTON_DPAD_DOWN = 12
  GAMEPAD_BUTTON_DPAD_LEFT = 13
  GAMEPAD_BUTTON_DPAD_RIGHT = 14
  GAMEPAD_BUTTON_MISC1 = 15
  GAMEPAD_BUTTON_PADDLE1 = 16
  GAMEPAD_BUTTON_PADDLE2 = 17
  GAMEPAD_BUTTON_PADDLE3 = 18
  GAMEPAD_BUTTON_PADDLE4 = 19
  GAMEPAD_BUTTON_TOUCHPAD = 20
  GAMEPAD_BUTTON_MAX = 21
  GAMEPAD_AXIS_INVALID = -1
  GAMEPAD_AXIS_LEFTX = 0
  GAMEPAD_AXIS_LEFTY = 1
  GAMEPAD_AXIS_RIGHTX = 2
  GAMEPAD_AXIS_RIGHTY = 3
  GAMEPAD_AXIS_LEFT_TRIGGER = 4
  GAMEPAD_AXIS_RIGHT_TRIGGER = 5
  GAMEPAD_AXIS_MAX = 6
  GAMEPAD_BINDTYPE_NONE = 0
  GAMEPAD_BINDTYPE_BUTTON = 1
  GAMEPAD_BINDTYPE_AXIS = 2
  GAMEPAD_BINDTYPE_HAT = 3

  # Typedef


  class GamepadBinding_value_hat < FFI::Struct
    layout(
        :hat, :int,
        :hat_mask, :int,
    )
  end

  class GamepadBinding_value < FFI::Struct
    layout(
        :button, :int,
        :axis, :int,
        :hat, GamepadBinding_value_hat,
    )
  end

  class GamepadBinding < FFI::Struct
    layout(
        :bindType, :int,
        :value, GamepadBinding_value,
    )
  end

  typedef :int, :SDL_GamepadType
  typedef :int, :SDL_GamepadButton
  typedef :int, :SDL_GamepadAxis
  typedef :int, :SDL_GamepadBindingType

  # Struct


  # Function

  def self.setup_gamepad_symbols(output_error = false)
    symbols = [
      :SDL_AddGamepadMapping,
      :SDL_AddGamepadMappingsFromRW,
      :SDL_GetNumGamepadMappings,
      :SDL_GetGamepadMappingForIndex,
      :SDL_GetGamepadMappingForGUID,
      :SDL_GetGamepadMapping,
      :SDL_GetGamepads,
      :SDL_IsGamepad,
      :SDL_GetGamepadInstanceName,
      :SDL_GetGamepadInstancePath,
      :SDL_GetGamepadInstancePlayerIndex,
      :SDL_GetGamepadInstanceGUID,
      :SDL_GetGamepadInstanceVendor,
      :SDL_GetGamepadInstanceProduct,
      :SDL_GetGamepadInstanceProductVersion,
      :SDL_GetGamepadInstanceType,
      :SDL_GetGamepadInstanceMapping,
      :SDL_OpenGamepad,
      :SDL_GetGamepadFromInstanceID,
      :SDL_GetGamepadFromPlayerIndex,
      :SDL_GetGamepadName,
      :SDL_GetGamepadPath,
      :SDL_GetGamepadType,
      :SDL_GetGamepadPlayerIndex,
      :SDL_SetGamepadPlayerIndex,
      :SDL_GetGamepadVendor,
      :SDL_GetGamepadProduct,
      :SDL_GetGamepadProductVersion,
      :SDL_GetGamepadFirmwareVersion,
      :SDL_GetGamepadSerial,
      :SDL_GamepadConnected,
      :SDL_GetGamepadJoystick,
      :SDL_SetGamepadEventsEnabled,
      :SDL_GamepadEventsEnabled,
      :SDL_UpdateGamepads,
      :SDL_GetGamepadAxisFromString,
      :SDL_GetGamepadStringForAxis,
      :SDL_GetGamepadBindForAxis,
      :SDL_GamepadHasAxis,
      :SDL_GetGamepadAxis,
      :SDL_GetGamepadButtonFromString,
      :SDL_GetGamepadStringForButton,
      :SDL_GetGamepadBindForButton,
      :SDL_GamepadHasButton,
      :SDL_GetGamepadButton,
      :SDL_GetNumGamepadTouchpads,
      :SDL_GetNumGamepadTouchpadFingers,
      :SDL_GetGamepadTouchpadFinger,
      :SDL_GamepadHasSensor,
      :SDL_SetGamepadSensorEnabled,
      :SDL_GamepadSensorEnabled,
      :SDL_GetGamepadSensorDataRate,
      :SDL_GetGamepadSensorData,
      :SDL_RumbleGamepad,
      :SDL_RumbleGamepadTriggers,
      :SDL_GamepadHasLED,
      :SDL_GamepadHasRumble,
      :SDL_GamepadHasRumbleTriggers,
      :SDL_SetGamepadLED,
      :SDL_SendGamepadEffect,
      :SDL_CloseGamepad,
      :SDL_GetGamepadAppleSFSymbolsNameForButton,
      :SDL_GetGamepadAppleSFSymbolsNameForAxis,
    ]
    apis = {
      :SDL_AddGamepadMapping => :AddGamepadMapping,
      :SDL_AddGamepadMappingsFromRW => :AddGamepadMappingsFromRW,
      :SDL_GetNumGamepadMappings => :GetNumGamepadMappings,
      :SDL_GetGamepadMappingForIndex => :GetGamepadMappingForIndex,
      :SDL_GetGamepadMappingForGUID => :GetGamepadMappingForGUID,
      :SDL_GetGamepadMapping => :GetGamepadMapping,
      :SDL_GetGamepads => :GetGamepads,
      :SDL_IsGamepad => :IsGamepad,
      :SDL_GetGamepadInstanceName => :GetGamepadInstanceName,
      :SDL_GetGamepadInstancePath => :GetGamepadInstancePath,
      :SDL_GetGamepadInstancePlayerIndex => :GetGamepadInstancePlayerIndex,
      :SDL_GetGamepadInstanceGUID => :GetGamepadInstanceGUID,
      :SDL_GetGamepadInstanceVendor => :GetGamepadInstanceVendor,
      :SDL_GetGamepadInstanceProduct => :GetGamepadInstanceProduct,
      :SDL_GetGamepadInstanceProductVersion => :GetGamepadInstanceProductVersion,
      :SDL_GetGamepadInstanceType => :GetGamepadInstanceType,
      :SDL_GetGamepadInstanceMapping => :GetGamepadInstanceMapping,
      :SDL_OpenGamepad => :OpenGamepad,
      :SDL_GetGamepadFromInstanceID => :GetGamepadFromInstanceID,
      :SDL_GetGamepadFromPlayerIndex => :GetGamepadFromPlayerIndex,
      :SDL_GetGamepadName => :GetGamepadName,
      :SDL_GetGamepadPath => :GetGamepadPath,
      :SDL_GetGamepadType => :GetGamepadType,
      :SDL_GetGamepadPlayerIndex => :GetGamepadPlayerIndex,
      :SDL_SetGamepadPlayerIndex => :SetGamepadPlayerIndex,
      :SDL_GetGamepadVendor => :GetGamepadVendor,
      :SDL_GetGamepadProduct => :GetGamepadProduct,
      :SDL_GetGamepadProductVersion => :GetGamepadProductVersion,
      :SDL_GetGamepadFirmwareVersion => :GetGamepadFirmwareVersion,
      :SDL_GetGamepadSerial => :GetGamepadSerial,
      :SDL_GamepadConnected => :GamepadConnected,
      :SDL_GetGamepadJoystick => :GetGamepadJoystick,
      :SDL_SetGamepadEventsEnabled => :SetGamepadEventsEnabled,
      :SDL_GamepadEventsEnabled => :GamepadEventsEnabled,
      :SDL_UpdateGamepads => :UpdateGamepads,
      :SDL_GetGamepadAxisFromString => :GetGamepadAxisFromString,
      :SDL_GetGamepadStringForAxis => :GetGamepadStringForAxis,
      :SDL_GetGamepadBindForAxis => :GetGamepadBindForAxis,
      :SDL_GamepadHasAxis => :GamepadHasAxis,
      :SDL_GetGamepadAxis => :GetGamepadAxis,
      :SDL_GetGamepadButtonFromString => :GetGamepadButtonFromString,
      :SDL_GetGamepadStringForButton => :GetGamepadStringForButton,
      :SDL_GetGamepadBindForButton => :GetGamepadBindForButton,
      :SDL_GamepadHasButton => :GamepadHasButton,
      :SDL_GetGamepadButton => :GetGamepadButton,
      :SDL_GetNumGamepadTouchpads => :GetNumGamepadTouchpads,
      :SDL_GetNumGamepadTouchpadFingers => :GetNumGamepadTouchpadFingers,
      :SDL_GetGamepadTouchpadFinger => :GetGamepadTouchpadFinger,
      :SDL_GamepadHasSensor => :GamepadHasSensor,
      :SDL_SetGamepadSensorEnabled => :SetGamepadSensorEnabled,
      :SDL_GamepadSensorEnabled => :GamepadSensorEnabled,
      :SDL_GetGamepadSensorDataRate => :GetGamepadSensorDataRate,
      :SDL_GetGamepadSensorData => :GetGamepadSensorData,
      :SDL_RumbleGamepad => :RumbleGamepad,
      :SDL_RumbleGamepadTriggers => :RumbleGamepadTriggers,
      :SDL_GamepadHasLED => :GamepadHasLED,
      :SDL_GamepadHasRumble => :GamepadHasRumble,
      :SDL_GamepadHasRumbleTriggers => :GamepadHasRumbleTriggers,
      :SDL_SetGamepadLED => :SetGamepadLED,
      :SDL_SendGamepadEffect => :SendGamepadEffect,
      :SDL_CloseGamepad => :CloseGamepad,
      :SDL_GetGamepadAppleSFSymbolsNameForButton => :GetGamepadAppleSFSymbolsNameForButton,
      :SDL_GetGamepadAppleSFSymbolsNameForAxis => :GetGamepadAppleSFSymbolsNameForAxis,
    }
    args = {
      :SDL_AddGamepadMapping => [:pointer],
      :SDL_AddGamepadMappingsFromRW => [:pointer, :int],
      :SDL_GetNumGamepadMappings => [],
      :SDL_GetGamepadMappingForIndex => [:int],
      :SDL_GetGamepadMappingForGUID => [SDL_JoystickGUID],
      :SDL_GetGamepadMapping => [:pointer],
      :SDL_GetGamepads => [:pointer],
      :SDL_IsGamepad => [:uint],
      :SDL_GetGamepadInstanceName => [:uint],
      :SDL_GetGamepadInstancePath => [:uint],
      :SDL_GetGamepadInstancePlayerIndex => [:uint],
      :SDL_GetGamepadInstanceGUID => [:uint],
      :SDL_GetGamepadInstanceVendor => [:uint],
      :SDL_GetGamepadInstanceProduct => [:uint],
      :SDL_GetGamepadInstanceProductVersion => [:uint],
      :SDL_GetGamepadInstanceType => [:uint],
      :SDL_GetGamepadInstanceMapping => [:uint],
      :SDL_OpenGamepad => [:uint],
      :SDL_GetGamepadFromInstanceID => [:uint],
      :SDL_GetGamepadFromPlayerIndex => [:int],
      :SDL_GetGamepadName => [:pointer],
      :SDL_GetGamepadPath => [:pointer],
      :SDL_GetGamepadType => [:pointer],
      :SDL_GetGamepadPlayerIndex => [:pointer],
      :SDL_SetGamepadPlayerIndex => [:pointer, :int],
      :SDL_GetGamepadVendor => [:pointer],
      :SDL_GetGamepadProduct => [:pointer],
      :SDL_GetGamepadProductVersion => [:pointer],
      :SDL_GetGamepadFirmwareVersion => [:pointer],
      :SDL_GetGamepadSerial => [:pointer],
      :SDL_GamepadConnected => [:pointer],
      :SDL_GetGamepadJoystick => [:pointer],
      :SDL_SetGamepadEventsEnabled => [:int],
      :SDL_GamepadEventsEnabled => [],
      :SDL_UpdateGamepads => [],
      :SDL_GetGamepadAxisFromString => [:pointer],
      :SDL_GetGamepadStringForAxis => [:int],
      :SDL_GetGamepadBindForAxis => [:pointer, :int],
      :SDL_GamepadHasAxis => [:pointer, :int],
      :SDL_GetGamepadAxis => [:pointer, :int],
      :SDL_GetGamepadButtonFromString => [:pointer],
      :SDL_GetGamepadStringForButton => [:int],
      :SDL_GetGamepadBindForButton => [:pointer, :int],
      :SDL_GamepadHasButton => [:pointer, :int],
      :SDL_GetGamepadButton => [:pointer, :int],
      :SDL_GetNumGamepadTouchpads => [:pointer],
      :SDL_GetNumGamepadTouchpadFingers => [:pointer, :int],
      :SDL_GetGamepadTouchpadFinger => [:pointer, :int, :int, :pointer, :pointer, :pointer, :pointer],
      :SDL_GamepadHasSensor => [:pointer, :int],
      :SDL_SetGamepadSensorEnabled => [:pointer, :int, :int],
      :SDL_GamepadSensorEnabled => [:pointer, :int],
      :SDL_GetGamepadSensorDataRate => [:pointer, :int],
      :SDL_GetGamepadSensorData => [:pointer, :int, :pointer, :int],
      :SDL_RumbleGamepad => [:pointer, :ushort, :ushort, :uint],
      :SDL_RumbleGamepadTriggers => [:pointer, :ushort, :ushort, :uint],
      :SDL_GamepadHasLED => [:pointer],
      :SDL_GamepadHasRumble => [:pointer],
      :SDL_GamepadHasRumbleTriggers => [:pointer],
      :SDL_SetGamepadLED => [:pointer, :uchar, :uchar, :uchar],
      :SDL_SendGamepadEffect => [:pointer, :pointer, :int],
      :SDL_CloseGamepad => [:pointer],
      :SDL_GetGamepadAppleSFSymbolsNameForButton => [:pointer, :int],
      :SDL_GetGamepadAppleSFSymbolsNameForAxis => [:pointer, :int],
    }
    retvals = {
      :SDL_AddGamepadMapping => :int,
      :SDL_AddGamepadMappingsFromRW => :int,
      :SDL_GetNumGamepadMappings => :int,
      :SDL_GetGamepadMappingForIndex => :pointer,
      :SDL_GetGamepadMappingForGUID => :pointer,
      :SDL_GetGamepadMapping => :pointer,
      :SDL_GetGamepads => :pointer,
      :SDL_IsGamepad => :int,
      :SDL_GetGamepadInstanceName => :pointer,
      :SDL_GetGamepadInstancePath => :pointer,
      :SDL_GetGamepadInstancePlayerIndex => :int,
      :SDL_GetGamepadInstanceGUID => JoystickGUID.by_value,
      :SDL_GetGamepadInstanceVendor => :ushort,
      :SDL_GetGamepadInstanceProduct => :ushort,
      :SDL_GetGamepadInstanceProductVersion => :ushort,
      :SDL_GetGamepadInstanceType => :int,
      :SDL_GetGamepadInstanceMapping => :pointer,
      :SDL_OpenGamepad => :pointer,
      :SDL_GetGamepadFromInstanceID => :pointer,
      :SDL_GetGamepadFromPlayerIndex => :pointer,
      :SDL_GetGamepadName => :pointer,
      :SDL_GetGamepadPath => :pointer,
      :SDL_GetGamepadType => :int,
      :SDL_GetGamepadPlayerIndex => :int,
      :SDL_SetGamepadPlayerIndex => :int,
      :SDL_GetGamepadVendor => :ushort,
      :SDL_GetGamepadProduct => :ushort,
      :SDL_GetGamepadProductVersion => :ushort,
      :SDL_GetGamepadFirmwareVersion => :ushort,
      :SDL_GetGamepadSerial => :pointer,
      :SDL_GamepadConnected => :int,
      :SDL_GetGamepadJoystick => :pointer,
      :SDL_SetGamepadEventsEnabled => :void,
      :SDL_GamepadEventsEnabled => :int,
      :SDL_UpdateGamepads => :void,
      :SDL_GetGamepadAxisFromString => :int,
      :SDL_GetGamepadStringForAxis => :pointer,
      :SDL_GetGamepadBindForAxis => GamepadBinding.by_value,
      :SDL_GamepadHasAxis => :int,
      :SDL_GetGamepadAxis => :short,
      :SDL_GetGamepadButtonFromString => :int,
      :SDL_GetGamepadStringForButton => :pointer,
      :SDL_GetGamepadBindForButton => GamepadBinding.by_value,
      :SDL_GamepadHasButton => :int,
      :SDL_GetGamepadButton => :uchar,
      :SDL_GetNumGamepadTouchpads => :int,
      :SDL_GetNumGamepadTouchpadFingers => :int,
      :SDL_GetGamepadTouchpadFinger => :int,
      :SDL_GamepadHasSensor => :int,
      :SDL_SetGamepadSensorEnabled => :int,
      :SDL_GamepadSensorEnabled => :int,
      :SDL_GetGamepadSensorDataRate => :float,
      :SDL_GetGamepadSensorData => :int,
      :SDL_RumbleGamepad => :int,
      :SDL_RumbleGamepadTriggers => :int,
      :SDL_GamepadHasLED => :int,
      :SDL_GamepadHasRumble => :int,
      :SDL_GamepadHasRumbleTriggers => :int,
      :SDL_SetGamepadLED => :int,
      :SDL_SendGamepadEffect => :int,
      :SDL_CloseGamepad => :void,
      :SDL_GetGamepadAppleSFSymbolsNameForButton => :pointer,
      :SDL_GetGamepadAppleSFSymbolsNameForAxis => :pointer,
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

